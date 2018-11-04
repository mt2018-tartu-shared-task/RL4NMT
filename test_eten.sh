ROOT_DIR= #PUT ROOT DIR HERE 
export PYTHONPATH=${ROOT_DIR}/:${PYTHONPATH}
export CUDA_VISIBLE_DEVICES=7
binFile=${ROOT_DIR}/tensor2tensor/bin

beamsize=${2:-6}
PROBLEM=translate_eten
MODEL=transformer
HPARAMS=eten_transformer_rl_delta_setting

DATA_DIR=${ROOT_DIR}/../transformer_data/eten
USR_DIR=${ROOT_DIR}/eten
ROOT_MODEL=${ROOT_DIR}/model/${HPARAMS}_dupe

${binFile}/t2t-decoder \
  --t2t_usr_dir=$USR_DIR \
  --data_dir=$DATA_DIR \
  --problems=$PROBLEM \
  --model=$MODEL \
  --hparams_set=$HPARAMS \
  --output_dir=${ROOT_MODEL} \
  --decode_hparams="beam_size=${beamsize},alpha=1.1,batch_size=32" \
  --decode_from_file=../transformer_data/eten/test.et \
  --worker_gpu=1

