python src/run_t5.py \
   --do_train \
   --do_predict \
   --predict_with_generate \
   --model_name_or_path Salesforce/codet5p-220m \
   --data_dir CODETASK_Benchmark \
   --task_order CONCODE,CodeTrans,CodeSearchNet,BFP \
   --task_config_dir configs/CodeTask/CONCODE \
   --output_dir logs_and_outputs/your_job_name/outputs/1-CONCODE \
   --per_device_train_batch_size 32 \
   --per_device_eval_batch_size 32 \
   --gradient_accumulation_steps 1 \
   --learning_rate 0.0003 \
   --num_train_epochs 3 \
   --bf16 \
   --run_name your_job_name \
   --max_source_length 320 \
   --max_target_length 150 \
   --generation_max_length 150 \
   --add_task_name False \
   --add_dataset_name False \
   --overwrite_output_dir \
   --overwrite_cache \
   --lr_scheduler_type constant \
   --warmup_steps 0 \
   --logging_strategy steps \
   --logging_steps 10 \
   --metric_for_best_model eval_exact_match_for_imdb  \
   --evaluation_strategy steps \
   --save_strategy steps \
   --save_total_limit 1 \
   --load_best_model_at_end \
   --lora_r 8 \
   --lora_alpha 32 \
   --lora_dropout 0.0 \
   --data_replay_freq -1 \
   --kl_ratio 0.1 \
   --attn_temperature 1 \
   --max_train_samples 20000 \

# python src/run_t5.py \
#    --do_train \
#    --do_predict \
#    --predict_with_generate \
#    --model_name_or_path Salesforce/codet5p-220m \
#    --previous_lora_path logs_and_outputs/your_job_name/outputs/1-CONCODE/saved_weights \
#    --previous_prompt_key_path logs_and_outputs/your_job_name/outputs/1-CONCODE/saved_weights/prompts_keys_till_now.pt \
#    --data_dir CODETASK_Benchmark \
#    --task_order CONCODE,CodeTrans,CodeSearchNet,BFP \
#    --task_config_dir configs/CodeTask/CodeTrans \
#    --output_dir logs_and_outputs/your_job_name/outputs/2-CodeTrans \
#    --per_device_train_batch_size 32 \
#    --per_device_eval_batch_size 16 \
#    --gradient_accumulation_steps 1 \
#    --learning_rate 0.0003 \
#    --num_train_epochs 3 \
#    --bf16 \
#    --run_name your_job_name \
#    --max_source_length 320 \
#    --max_target_length 256 \
#    --generation_max_length 256 \
#    --add_task_name False \
#    --add_dataset_name False \
#    --overwrite_output_dir \
#    --overwrite_cache \
#    --lr_scheduler_type constant \
#    --warmup_steps 0 \
#    --logging_strategy steps \
#    --logging_steps 10 \
#    --metric_for_best_model eval_exact_match_for_mnli \
#    --evaluation_strategy steps \
#    --save_strategy steps \
#    --save_total_limit 1 \
#    --load_best_model_at_end \
#    --lora_r 8 \
#    --lora_alpha 32 \
#    --lora_dropout 0.0 \
#    --data_replay_freq -1 \
#    --kl_ratio 0.1 \
#    --attn_temperature 1 \
#    --max_train_samples 100 \
#    --max_eval_samples 100 \
#    --max_predict_samples 100

# python src/run_t5.py \
#    --do_train \
#    --do_predict \
#    --predict_with_generate \
#    --model_name_or_path Salesforce/codet5p-220m \
#    --previous_lora_path logs_and_outputs/your_job_name/outputs/1-CONCODE/saved_weights,logs_and_outputs/your_job_name/outputs/2-CodeTrans/saved_weights \
#    --previous_prompt_key_path logs_and_outputs/your_job_name/outputs/2-CodeTrans/saved_weights/prompts_keys_till_now.pt \
#    --data_dir CODETASK_Benchmark \
#    --task_order CONCODE,CodeTrans,CodeSearchNet,BFP \
#    --task_config_dir configs/CodeTask/CodeSearchNet \
#    --output_dir logs_and_outputs/your_job_name/outputs/3-CodeSearchNet \
#    --per_device_train_batch_size 32 \
#    --per_device_eval_batch_size 16 \
#    --gradient_accumulation_steps 1 \
#    --learning_rate 0.0003 \
#    --num_train_epochs 3 \
#    --bf16 \
#    --run_name your_job_name \
#    --max_source_length 256 \
#    --max_target_length 128 \
#    --generation_max_length 128 \
#    --add_task_name False \
#    --add_dataset_name False \
#    --overwrite_output_dir \
#    --overwrite_cache \
#    --lr_scheduler_type constant \
#    --warmup_steps 0 \
#    --logging_strategy steps \
#    --logging_steps 10 \
#    --metric_for_best_model eval_exact_match_for_mnli \
#    --evaluation_strategy steps \
#    --save_strategy steps \
#    --save_total_limit 1 \
#    --load_best_model_at_end \
#    --lora_r 8 \
#    --lora_alpha 32 \
#    --lora_dropout 0.0 \
#    --data_replay_freq -1 \
#    --kl_ratio 0.1 \
#    --attn_temperature 1 

# python src/run_t5.py \
#    --do_train \
#    --do_predict \
#    --predict_with_generate \
#    --model_name_or_path Salesforce/codet5p-220m \
#    --previous_lora_path logs_and_outputs/your_job_name/outputs/1-CONCODE/saved_weights,logs_and_outputs/your_job_name/outputs/2-CodeTrans/saved_weights,logs_and_outputs/your_job_name/outputs/3-CodeSearchNet/saved_weights \
#    --previous_prompt_key_path logs_and_outputs/your_job_name/outputs/3-CodeSearchNet/saved_weights/prompts_keys_till_now.pt \
#    --data_dir CODETASK_Benchmark \
#    --task_order CONCODE,CodeTrans,CodeSearchNet,BFP \
#    --task_config_dir configs/CodeTask/BFP \
#    --output_dir logs_and_outputs/your_job_name/outputs/4-BFP \
#    --per_device_train_batch_size 32 \
#    --per_device_eval_batch_size 16 \
#    --gradient_accumulation_steps 1 \
#    --learning_rate 0.0003 \
#    --num_train_epochs 3 \
#    --bf16 \
#    --run_name your_job_name \
#    --max_source_length 130 \
#    --max_target_length 120 \
#    --generation_max_length 120 \
#    --add_task_name False \
#    --add_dataset_name False \
#    --overwrite_output_dir \
#    --overwrite_cache \
#    --lr_scheduler_type constant \
#    --warmup_steps 0 \
#    --logging_strategy steps \
#    --logging_steps 10 \
#    --metric_for_best_model eval_exact_match_for_mnli \
#    --evaluation_strategy steps \
#    --save_strategy steps \
#    --save_total_limit 1 \
#    --load_best_model_at_end \
#    --lora_r 8 \
#    --lora_alpha 32 \
#    --lora_dropout 0.0 \
#    --data_replay_freq -1 \
#    --kl_ratio 0.1 \
#    --attn_temperature 1