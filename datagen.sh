export PYTHONPATH=./:${PYTHONPATH}

./tensor2tensor/bin/t2t-datagen\
    --problem=translate_eten\
    --data_dir=../transformer_data/eten\
    --tmp_dir=../tmp\
    --t2t_usr_dir=./eten

