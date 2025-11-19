#!/bin/bash
#SBATCH -J cl                           
#SBATCH -o cl-%j.out                       
#SBATCH -p compute 
#SBATCH -N 1                           
#SBATCH -t 5:00:00   
#SBATCH --mem 64G 
#SBATCH --gres=gpu:a100-sxm4-80gb:1        


export CUDA_DEVICE_ORDER="PCI_BUS_ID"

port=$(shuf -i25000-30000 -n1)  

lr=0.001
topk=20


# CUDA_VISIBLE_DEVICES=0 deepspeed --master_port $port src/run_uie_lora.py \
python  src/run_uie_lora.py \
   --do_train \
   --do_predict \
   --predict_with_generate \
   --model_name_or_path Salesforce/codet5p-770m \
   --data_dir CodeTask_Benchmark \
   --task_config_dir configs/CodeTask_configs/lookback_BFP \
   --instruction_file configs/instruction_config.json \
   --instruction_strategy single \
   --output_dir logs_and_outputs/Ours_CL/outputs_lr_0001_topk_${topk}/lookback_BFP \
   --per_device_train_batch_size 16 \
   --per_device_eval_batch_size 32 \
   --gradient_accumulation_steps 1 \
   --learning_rate $lr \
   --max_steps  5000 \
   --run_name Ours_CL_round1 \
   --max_source_length 5 \
   --max_target_length 512 \
   --generation_max_length 512 \
   --add_task_name False \
   --add_dataset_name False \
   --overwrite_output_dir \
   --overwrite_cache \
   --lr_scheduler_type constant \
   --warmup_steps 0 \
   --logging_strategy steps \
   --save_strategy no\
   --top_k $topk  \
   --max_train_samples 20 \
   --max_predict_samples 1 \
