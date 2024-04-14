from transformers import AutoModelForCausalLM, AutoTokenizer
from transformers import TrainingArguments
from peft import LoraConfig, TaskType, PeftModel, LoftQConfig, get_peft_model
from trl import DataCollatorForCompletionOnlyLM, SFTTrainer
from datasets import load_dataset
import torch

model_name = "deepseek-ai/deepseek-coder-6.7b-instruct"
model_dir = "..."  # 原始模型所存放的文件夹， 例如 ‘nl2sql/hf_models/deepseek’
dataset = load_dataset('csv', data_files={
    'train': '...',  # 训练数据路径， 例如'nl2sql/data/nl2sql/train_dataset.csv'
    'validation': '...'  # 验证数据路径， 例如'nl2sql/data/nl2sql/val_dataset.csv'
})
peft_output_dir = "..."  # PEFT层的输出路径，例如'nl2sql/peft_models/nl2sql/peft_model'

# Load model's tokenizer
tokenizer = AutoTokenizer.from_pretrained(model_name)
tokenizer.pad_token = tokenizer.eos_token
tokenizer.pad_token_id = tokenizer.eos_token_id
tokenizer.padding_side = 'right'  # deal with overflow issues when training in half-precision

# original_model_dir = "nl2sql/models/deepseek33B"
model = AutoModelForCausalLM.from_pretrained(model_dir, device_map='auto', torch_dtype=torch.bfloat16,
                                             force_download=False, resume_download=False)
print(model)
print("length of dataset['train']: ", len(dataset['train']))
print("length of dataset['validation']: ", len(dataset['validation']))


def formatting_prompt_func(dataset):
    '''
    :param dataset: the 'train' or 'validation' return of datasets.load_dataset()
    :return: a list, the element of which is a message containing of input and output

    <｜begin▁of▁sentence｜>You are an AI programming assistant,
    utilizing the Deepseek Coder model, developed by Deepseek Company,
    and you only answer questions related to computer science.
    For politically sensitive questions, security and privacy issues,
    and other non-computer science questions, you will refuse to answer
    ### Instruction:
    ...
    ###
    Question:
    ...
    ### Response:
    ...
    '''
    formatted_texts = []
    for i in range(len(dataset['prompt2'])):  # be care of this line
        user_message = dataset['prompt2'][i]
        assistant_message = dataset['groundtruth_sql_schema'][i]
        message = [
            {'role': 'user', 'content': user_message},
            {'role': 'assistant', 'content': assistant_message}
        ]
        text = tokenizer.apply_chat_template(message, tokenize=False)
        formatted_texts.append(text)
    return formatted_texts

response_template = '### Response:'
collator = DataCollatorForCompletionOnlyLM(response_template, tokenizer=tokenizer)


# PEFT train
## Initialize lora parameters
loftq_config = LoftQConfig(loftq_bits=4)
peft_config = LoraConfig(
    task_type=TaskType.CAUSAL_LM,
    inference_mode=False,
    r=64,
    lora_alpha=32,
    use_rslora=True,
    lora_dropout=0.1,
    target_modules=[
        "q_proj",
        "v_proj",
        "k_proj",
        "o_proj",
        "gate_proj",
        "up_proj",
        "down_proj",
        "lm_head"
    ],
    init_lora_weights='loftq',
    loftq_config=loftq_config
)


num_train_epochs = 1
bf16 = True
overwrite_output_dir = True
per_device_train_batch_size = 1
per_device_eval_batch_size = 1
gradient_accumulation_steps = 16
gradient_checkpointing = True
evaluation_strategy = "steps"
learning_rate = 5e-5
weight_decay = 0.01
lr_scheduler_type = "cosine"
warmup_ratio = 0.01
max_grad_norm = 0.3
group_by_length = True
auto_find_batch_size = False
save_steps = 50
logging_steps = 10
load_best_model_at_end = False
packing = False
save_total_limit = 3
neftune_noise_alpha = 5
report_to = "wandb"
max_seq_length = 2100  # set based on the maximum number of queries

training_arguments = TrainingArguments(
    output_dir=peft_output_dir,
    overwrite_output_dir=overwrite_output_dir,
    num_train_epochs=num_train_epochs,
    load_best_model_at_end=load_best_model_at_end,
    per_device_train_batch_size=per_device_train_batch_size,
    per_device_eval_batch_size=per_device_eval_batch_size,
    evaluation_strategy=evaluation_strategy, eval_steps=0.15,
    max_grad_norm=max_grad_norm,
    auto_find_batch_size=auto_find_batch_size,
    save_total_limit=save_total_limit,
    gradient_accumulation_steps=gradient_accumulation_steps,
    save_steps=save_steps,
    logging_steps=logging_steps,
    learning_rate=learning_rate,
    weight_decay=weight_decay,
    bf16=bf16,
    warmup_ratio=warmup_ratio,
    group_by_length=group_by_length,
    lr_scheduler_type=lr_scheduler_type,
    report_to=report_to,
    neftune_noise_alpha=neftune_noise_alpha
)
trainer = SFTTrainer(
    model=model,
    peft_config=peft_config,
    train_dataset=dataset['train'],
    eval_dataset=dataset['validation'],
    formatting_func=formatting_prompt_func,
    data_collator=collator,
    tokenizer=tokenizer,
    args=training_arguments,
    max_seq_length=max_seq_length,
    packing=packing
)
trainer.train()

trainer.model.save_pretrained(peft_output_dir)