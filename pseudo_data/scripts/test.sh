#!/bin/bash      


lr=0.001
topk=20


# CUDA_VISIBLE_DEVICES=0 deepspeed --master_port $port src/run_uie_lora.py \
python  src/run_uie_lora.py \
   --do_train \
   --do_predict \
   --predict_with_generate \
   --model_name_or_path google-t5/t5-large \
   --data_dir CL_Benchmark \
   --task_config_dir configs/Ours_CL_configs/lookback_task181_outcome_extraction \
   --instruction_file configs/instruction_config.json \
   --instruction_strategy single \
   --output_dir logs_and_outputs/Ours_CL/outputs_lr_0001_topk_${topk}/lookback_task181_outcome_extraction \
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
   --logging_strategy epoch \
   --save_strategy epoch \
   --top_k $topk  \