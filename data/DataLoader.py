import json
import pandas as pd
import sqlite3
from sql_metadata import Parser
import re


class DataLoader:
    def __init__(self, json_path, pred_tables=None):
        self.jason_path = json_path

        df = pd.read_json(json_path)
        self.nl_list = df['question'].tolist()
        self.db_list = df['db_id'].tolist()
        self.sql_list = df['query'].tolist()

        self.tables_info = []
        if pred_tables is not None:
            for db, tables in zip(self.db_list, pred_tables):
                if tables != 'Error output' and tables != 'Transforming error':
                    table_dict = {}
                    for table in tables:
                        data_path = re.sub(r'/[^/]*$', '', self.jason_path)
                        db_path = data_path + '/database/' + db + '/{}.sqlite'.format(db)
                        conn = sqlite3.connect(db_path)
                        cur = conn.cursor()

                        # try:  # if the pred_tables includes table that db doesn't have
                        #     cur.execute(f"PRAGMA table_info({table})")
                        # except sqlite3.OperationalError:
                        #     continue
                        try:  # Some predicted tables don't are not valid.
                            cur.execute(f"PRAGMA table_info({table})")
                        except sqlite3.OperationalError:
                            continue
                        cur_fetchall = cur.fetchall()
                        if cur_fetchall:
                            table_columns = []
                            for column in cur_fetchall:
                                # column[0] -> col_id, column[1] -> col_name, column[2] -> col_type
                                # column[3] -> col_notnull, column[4] -> col_default, column[5] -> col_pk
                                schema = column[1] + ' ' + column[2]
                                table_columns.append(schema)

                            table_dict[table] = table_columns
                    self.tables_info.append(table_dict)
                else:
                    data_path = re.sub(r'/[^/]*$', '', self.jason_path)
                    db_path = data_path + '/database/' + db + '/{}.sqlite'.format(db)

                    conn = sqlite3.connect(db_path)
                    cur = conn.cursor()
                    cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
                    tables = [table_name[0] for table_name in cur.fetchall()]
                    temp = {}
                    for table in tables:
                        cur.execute(f"PRAGMA table_info({table})")
                        table_columns = [column[1] for column in cur.fetchall()]

                        temp[table] = table_columns
                    self.tables_info.append(temp)
        else:
            for db in self.db_list:
                data_path = re.sub(r'/[^/]*$', '', self.jason_path)
                db_path = data_path + '/database/' + db + '/{}.sqlite'.format(db)

                conn = sqlite3.connect(db_path)
                cur = conn.cursor()
                cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
                tables = [table_name[0] for table_name in cur.fetchall()]
                temp = {}
                for table in tables:
                    cur.execute(f"PRAGMA table_info({table})")
                    table_columns = [column[1] for column in cur.fetchall()]
                    # table_columns = [column[1] + ' ' + column[2] for column in cur.fetchall()]

                    temp[table] = table_columns
                self.tables_info.append(temp)
        cur.close()
        conn.close()

        self.groundtruth_tables = []
        for sql in self.sql_list:
            sql_parser = Parser(sql)
            self.groundtruth_tables.append(sql_parser.tables)
    def get_prompt1(self):
        prompt = []
        for i, tables in enumerate(self.tables_info):  # tables is a dict
            database_schema = ""
            for key, values in tables.items():  # key is the table name, values is like [column_name datatype, ...]
                temp = ',\n'.join(values)
                schema = f'''\nCREATE TABLE `{key}` (\n{temp});\n'''
                # database_schema += schema
                # database_schema += f"Sample rows from the {key}:\n"
                # data_path = re.sub(r'/[^/]*$', '', self.jason_path)
                # db_path = data_path + '/database/' + self.db_list[i] + '/{}.sqlite'.format(self.db_list[i])
                # conn = sqlite3.connect(db_path)
                # cur = conn.cursor()
                # cur.execute(f"SELECT * FROM {key} LIMIT 3")
                # schema = '\n'.join([', '.join(str(ele) for ele in element) for element in cur.fetchall()])
                # database_schema += schema + '\n'
                database_schema += schema
            temp = f'''Given the following SQL tables, your job is to determine the tables that the question is referring to. Please format the answer in {{"tables": [entities]}}
{database_schema}
### 
Question: 
{self.nl_list[i]}'''
            prompt.append(temp)
        return prompt

    def get_prompt2(self):
        prompt = []
        for i, tables in enumerate(self.tables_info):  # tables is a dict
            database_schema = ""
            for key, values in tables.items():  # key is the table name, values is like [column_name datatype, ...]
                temp = ',\n'.join(values)
                schema = f'''\nCREATE TABLE {key} (\n{temp});\n'''
                database_schema += schema
                # print("database_schema: ", database_schema)
                database_schema += f"Sample rows from the {key}:\n"
                data_path = re.sub(r'/[^/]*$', '', self.jason_path)
                db_path = data_path + '/database/' + self.db_list[i] + '/{}.sqlite'.format(self.db_list[i])
                conn = sqlite3.connect(db_path)
                cur = conn.cursor()

                select_columns = [value.split(' ')[0] for value in values]  # select_column is like [columna_name, ...]
                select_columns = [f'`{value}`' for value in select_columns]  # avoid sqlite3.OperationalError when a column begins with number
                # print(select_columns)
                if select_columns == ['`People_ID`', '`Name`', '`Height`', '`Weight`', '`Home`']:
                    select_columns = ['`People_ID`', '`Name`', '`Height`', '`Weight`', '`Home Town`']
                if select_columns == ['`task_id`', '`project_id`', '`task_details`', '`eg`']:
                    select_columns = ['`task_id`', '`project_id`', '`task_details`', '`eg Agree Objectives`']
                cur.execute(f"SELECT {', '.join(select_columns)} FROM {key} LIMIT 3")

                schema = '\n'.join([', '.join(str(ele) for ele in element) for element in cur.fetchall()])
                # print("schema: ", schema)
                database_schema += schema + '\n'

            temp = f'''Given the following SQL tables, your job is to generate only one Sqlite SQL query given the user's question.
Put your answer inside the ```sql and ``` tags.
{database_schema}
### 
Question: 
{self.nl_list[i]}
'''
            prompt.append(temp)

        return prompt

    def get_short_tbinfo(self):  # only use in dataloader2
        short_tbinfo = []
        for i, tables in enumerate(self.tables_info):  # tables is a dict. all tables that sql needs in a db
            tables_dict = {}
            data_path = re.sub(r'/[^/]*$', '', self.jason_path)
            db_path = data_path + '/database/' + self.db_list[i] + '/{}.sqlite'.format(self.db_list[i])
            conn = sqlite3.connect(db_path)
            cur = conn.cursor()
            for table in tables.keys():  # a table in tables
                short_colinfo = []
                cur.execute(f"PRAGMA table_info({table})")
                cur_fetchall = cur.fetchall()  # all columns info
                sql_parser = Parser(self.sql_list[i])
                table_need_column = False  # if a table has short_colinfo
                for column in cur_fetchall:
                    if len(sql_parser.tables) == 1:
                        temp = column[1]
                    else:
                        temp = f'{table}.{column[1]}'
                    if temp.lower() in [ele.lower() for ele in sql_parser.columns]:
                        table_need_column = True
                        schema = column[1] + ' ' + column[2]
                        short_colinfo.append(schema)
                if not table_need_column:  # if a table doesn't have short_colinfo, then add the whole columns
                    for column in cur_fetchall:
                        schema = column[1] + ' ' + column[2]
                        short_colinfo.append(schema)

                tables_dict[table] = short_colinfo
            short_tbinfo.append(tables_dict)
        return short_tbinfo




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
# a = ["sadfaefa asdf{'tables': ['table1', 'table2']}", "asdfaese asdf{'tables': ['table3', 'table4']}"]
# clean_output = clean_outputs1(a)
# print(clean_output)

# I have a predicted table list: [[table1, table2], [table3], [table1, table4, table7]]
# And I have a groundtruth table list: [[table1, table2], [table3], [table1, table4, table7]]
def outputs1_evalution(outputs1, groundtruth_tables):
    subset_num, equal_num = 0, 0
    for pred_tables, gold_tables in zip(outputs1, groundtruth_tables):
        pred_tables = [pred_table.lower() for pred_table in pred_tables]
        gold_tables = [gold_tables.lower() for gold_tables in gold_tables]
        if set(gold_tables).issubset(set(pred_tables)):
            subset_num += 1
        if set(gold_tables) == set(pred_tables):
            equal_num += 1
    coverage_rate = round(subset_num / len(outputs1), 5)
    precision_rate = round(equal_num / len(outputs1), 5)
    return coverage_rate, precision_rate


def clean_outputs2(outputs2):
    outputs = []
    error_count = 0
    for i in range(len(outputs2)):
        match = re.findall(r"```sql(.*?)```", outputs2[i], re.DOTALL)
        # match = re.search(r"```sql\n(.*?);?$", outputs2[i], re.DOTALL)
        print(i, match)
        if match is None or match == [' and ']:
            print('index:', i)
            print(outputs2[i])
            outputs.append("SELECT * FROM mytable")
            error_count += 1
        else:
            # temp = match.group(1).replace("\n", " ")
            temp = match[1]
            outputs.append(temp.strip())
    print("Error output number: {}".format(error_count))
    return outputs

def get_groundtruth_sql_shcema(sql_list):
    temp = []
    for groundtruth_sql in sql_list:
        if groundtruth_sql[-1] != ';':
            shcema = f'''
```sql
{groundtruth_sql};
```
'''
            temp.append(shcema.strip())
        else:
            shcema = f'''
```sql
{groundtruth_sql}
```
'''
            temp.append(shcema.strip())
    return temp


# data_loader1
data_loader1 = DataLoader('D:/NL2SQL/Data/spider/test_data/dev.json')
print('data_loader1 length: ', len(data_loader1.groundtruth_tables))
print(data_loader1.get_prompt1()[1], data_loader1.get_prompt1()[-1], sep='\n')
print(data_loader1.sql_list[5000:5010])

print(data_loader1.tables_info[0].keys())

## Prompt1 and groundtruth_outputs1
with open('D:/NL2SQL/python_workspace/NL2SQL_data_preparation/experiment13/test/prompt_test.json', 'w') as f:
    json.dump(data_loader1.get_prompt1(), f)

outputs1 = []
for output1 in data_loader1.groundtruth_tables:
    temp = f'''{{"tables": {output1}}}'''
    outputs1.append(temp)
mydf = pd.DataFrame({'prompt1': data_loader1.get_prompt1(), 'outputs1': outputs1})
mydf.to_csv('D:/NL2SQL/python_workspace/NL2SQL_data_preparation/experiment11/to_table/val_dataset.csv', index=False)

## Outputs1
with open('liyanting/outputs1_test (7).json', 'r') as f:
    outputs1 = json.load(f)
outputs1 = clean_outputs1(outputs1)
print(outputs1[695])
print(outputs1_evalution(outputs1, data_loader1.groundtruth_tables))

# dataloader2
data_loader2 = DataLoader('D:/NL2SQL/Data/spider/test_data/dev.json', data_loader1.groundtruth_tables)
data_loader2 = DataLoader('D:/NL2SQL/Data/spider/test_data/dev.json', outputs1)
data_loader2 = DataLoader('D:/NL2SQL/Data/spider/train_merged.json')
data_loader2.tables_info = data_loader2.get_short_tbinfo()  # short columns info
a = data_loader2.get_prompt2()
b = data_loader2.groundtruth_tables
i = 40




## Prompt2
with open('experiment13/prompt2_train.json', 'w') as f:
    json.dump(data_loader2.get_prompt2(), f)

with open('experiment13/test/prompt2_test.json', 'r') as f:
    prompt2 = json.load(f)

print(len(prompt2))
## Outputs2
with open('D:/NL2SQL/python_workspace/NL2SQL_data_preparation/experiment12/outputs2_short_tables.json', 'r') as f:
    outputs2 = json.load(f)
outputs2 = clean_outputs2(outputs2)
print('outputs2 length: ', len(outputs2))
temp = []
for output in outputs2:
    temp.append(output.replace('\n', ' '))
outputs2 = temp
print(outputs2[40])

groundtruth_sql_shcema = get_groundtruth_sql_shcema(data_loader2.sql_list)
print(len(groundtruth_sql_shcema), len(data_loader2.get_prompt2()))
with open('D:/NL2SQL/python_workspace/NL2SQL_data_preparation/experiment13/groundtruth_sql_shcema_val.json', 'w') as f:
    json.dump(groundtruth_sql_shcema, f)

## Outputs2 to .sql file
with open('experiment12/pred_test.sql', 'w') as file:
    for output in outputs2:
        file.write(output + "\n")


# function to prepare train, val, test csv files
def prepare_data(in_path, out_path, dataset_type='train'):
    data_loader1 = DataLoader(in_path)
    data_loader2 = DataLoader(in_path, data_loader1.groundtruth_tables)

    with open(out_path + f'prompt2_{dataset_type}.json', 'w') as f:
        json.dump(data_loader2.get_prompt2(), f)

    groundtruth_sql_shcema = get_groundtruth_sql_shcema(data_loader2.sql_list)
    print(len(groundtruth_sql_shcema), len(data_loader2.get_prompt2()))
    with open(out_path + f'groundtruth_sql_shcema_{dataset_type}.json', 'w') as f:
        json.dump(groundtruth_sql_shcema, f)

in_path = 'D:/NL2SQL/Data/spider/train_merged.json'
out_path = 'D:/NL2SQL/python_workspace/NL2SQL_data_preparation/experiment8/'
prepare_data(in_path, out_path, 'train')












with open('D:/NL2SQL/python_workspace/NL2SQL_data_preparation/prompt2.json', 'w') as f:
    json.dump(data_loader2.get_prompt2(), f)

with open('D:/NL2SQL/python_workspace/NL2SQL_data_preparation/prompt2.json', 'r') as f:
    prompt2 = json.load(f)
print(prompt2[-2])

with open('D:/NL2SQL/python_workspace/NL2SQL_data_preparation/outputs2.json', 'r') as f:
    outputs2 = json.load(f)
outputs2 = clean_outputs2(outputs2)
print(outputs2[0], outputs2[1], outputs2[2], sep="\n")

with open('dev_pred.sql', 'w') as file:
    for output in outputs2:
        # 写入 SQL 语句并添加一个换行符
        file.write(output + "\n")


import sqlite3

db_path = "D:/NL2SQL/Data/spider/database/activity_1/activity_1.sqlite"
conn = sqlite3.connect(db_path)
cur = conn.cursor()
cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
for item in cur.fetchall():
    print(item[0])