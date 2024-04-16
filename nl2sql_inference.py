import pandas as pd
import json
import sqlite3
from transformers import AutoModelForCausalLM, AutoTokenizer
from peft import PeftModel
from transformers import StoppingCriteria
import torch
import re

class EosListStoppingCriteria(StoppingCriteria):
    def __init__(self, eos_sequence = [6203]):
        self.eos_sequence = eos_sequence

    def __call__(self, input_ids: torch.LongTensor, scores: torch.FloatTensor, **kwargs) -> bool:
        last_ids = input_ids[:,-len(self.eos_sequence):].tolist()
        return self.eos_sequence in last_ids


model_name = 'deepseek-ai/deepseek-coder-6.7b-instruct'  # 模型名称
model_path = 'nl2sql/models/deepseek'  # 模型路径
peft_layer_path = 'nl2sql/experiment8/peft_model'  # nl2sql_finetuning.py文件中peft_output_dir所保存的PEFT层路径
spider_database_path = '/hpc2hdd/home/tzou317/nl2sql2/spider/test_database'  # Spider测试数据集的数据库文件夹，例如'./spider/test_database'
spider_test_json_path = '/hpc2hdd/home/tzou317/nl2sql2/spider/test_data/dev.json'  # Spider的测试数据集的.json路径， 例如'./spider/test_data/dev.json'
test_data_output1 = '/hpc2hdd/home/tzou317/nl2sql2/zoutao/prompt2_with_perfect_tables.json'  # 阶段1 输出的outputs1的路径，例如'./outputs1_test.json'
test_data_output2 = '/hpc2hdd/home/tzou317/nl2sql2/pred_test.sql'  # 一个存储预测出的最终.sql文件的路径，例如'./pred_test.sql'


tokenizer = AutoTokenizer.from_pretrained(model_name)
tokenizer.pad_token = tokenizer.bos_token
tokenizer.pad_token_id = tokenizer.bos_token_id
tokenizer.padding_side = 'left'
tokenizer.encode(' ;')

model = AutoModelForCausalLM.from_pretrained(model_path, device_map='auto')  # important
# model = PeftModel.from_pretrained(model, peft_layer_path, torch_type=torch.bfloat16)
# model = model.merge_and_unload()
print('model merge succeeded')
model.eval()

def clean_outputs1(outputs1):
    '''
    :param outputs1:  The outputs1's json file
    :return: [[table1, table2, ...], [table1, table2, ...], ...]
    '''
    temp, error_count = [], 0
    for output in outputs1:
        matches = re.findall(r'\"tables\": (\[.*?\])', output)
        if len(matches) >= 2:
            try:
                temp.append(eval(matches[1]))
            except:  # 若匹配出类似'[mystring]'，则也认为是匹配失败
                print('Error1: no match for:')
                print(output)
                error_count += 1
        else:
            print('Error2: no match for:')
            print(output)
            error_count += 1
    print('total error number: {}'.format(error_count))
    return temp

def get_prompt2(question, target_db_path, table_list):
    conn = sqlite3.connect(target_db_path)
    cur = conn.cursor()
    database_schema = ''
    for table in table_list:
        try:
            cur.execute(f"PRAGMA table_info({table});")
        except Exception as e:
            print(table, 'is not found in target_db')
            continue
        database_schema += f"CREATE TABLE `{table}` (\n"
        cur_fetchall = cur.fetchall()
        for column in cur_fetchall:
            database_schema += column[1] + ' ' + column[2] + ',\n'
        database_schema = database_schema[:-2] + ');\n\n' + f"Sample rows from the `{table}`:\n"
        cur.execute(f"SELECT * FROM `{table}` LIMIT 3;")
        database_schema += '\n'.join([', '.join(str(ele) for ele in element) for element in cur.fetchall()])
    prompt2 = f'''Given the following SQL tables, your job is to generate only one Sqlite SQL query given the user's question.
Put your answer inside the ```sql and ``` tags.
{database_schema}
### 
Question: 
{question}'''
    return prompt2

df = pd.read_json(spider_test_json_path)
nl_list = df['question'].tolist()
db_list = df['db_id'].tolist()
target_db_paths = [f'{spider_database_path}/{db_name}/{db_name}.sqlite' for db_name in db_list]

with open(test_data_output1, 'r') as f:
    outputs1 = json.load(f)
# outputs1 = clean_outputs1(outputs1)

outputs2 = []
for i, output1 in enumerate(outputs1):
    print(f'Inference process: {i}/{len(outputs1)}')
    # prompt2 = get_prompt2(nl_list[i], target_db_paths[i], output1)
    # message = [{'role': 'user', 'content': prompt2.strip()}]
    message = [{'role': 'user', 'content': output1.strip()}]
    input2 = tokenizer.apply_chat_template(message, tokenize=True, return_tensors='pt', add_generation_prompt=True).to(
        model.device)
    responses = model.generate(
        input2,
        max_new_tokens=50,
        do_sample=False,
        pad_token_id=tokenizer.eos_token_id,
        eos_token_id=tokenizer.eos_token_id,
        stopping_criteria=[EosListStoppingCriteria()]
    )
    output2 = tokenizer.decode(responses[0], skip_special_tokens=True).strip()

    match = re.findall(r"```sql(.*?)(?:```|$)", output2, re.DOTALL)
    if match is None or match == [' and ']:
        print('output2 went wrong.')
        print('output2: ', output2)
        outputs2.append('SELECT * FROM mytable;')  # 当推理出现错误时，就添加'SELECT * FROM mytable;'以免出现空行。
    else:
        output2 = match[1].strip()
        output2 = output2.replace("\n", " ")
        print('output2: ', output2)
        outputs2.append(output2)
    if (i + 1) % 10 == 0:
        with open(test_data_output2, 'w') as file:
            for output2 in outputs2:
                file.write(output2 + "\n")

with open(test_data_output2, 'w') as file:
    for output2 in outputs2:
        file.write(output2 + "\n")

