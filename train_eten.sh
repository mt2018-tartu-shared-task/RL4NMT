export PYTHONPATH=./:${PYTHONPATH}
export CUDA_VISIBLE_DEVICES=3
binFile=./tensor2tensor/bin


PROBLEM=translate_eten
MODEL=transformer
HPARAMS=eten_transformer_rl_delta_setting
# HPARAMS=zhen_wmt17_transformer_rl_delta_setting_random
# HPARAMS=zhen_wmt17_transformer_rl_total_setting
# HPARAMS=zhen_wmt17_transformer_rl_total_setting_random
# HPARAMS=zhen_wmt17_transformer_rl_delta_setting_random_baseline
# HPARAMS=zhen_wmt17_transformer_rl_delta_setting_random_mle

DATA_DIR=../transformer_data/eten

TRAIN_DIR=./model/${HPARAMS}
mkdir -p  $TRAIN_DIR


${binFile}/t2t-trainer \
--t2t_usr_dir=./eten \
--data_dir=$DATA_DIR \
--problems=$PROBLEM \
--model=$MODEL \
--hparams_set=$HPARAMS \
--output_dir=$TRAIN_DIR \
--train_steps=300000 \
--save_checkpoints_steps=500 \
--keep_checkpoint_max=50 \
--local_eval_frequency=1000000 \
--hparams='batch_size=64,learning_rate=0.0001' \
--eval_steps=3 \
--worker_gpu=1 \


