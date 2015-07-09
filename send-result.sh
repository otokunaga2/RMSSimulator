#/bin/sh

######################################################
#
#このスクリプトは大量に生成されるシミュレーション結果を
#別ディレクトリへ移動することを目的としています
#
#created at 2015/06/05
#author tokunaga
######################################################


BASE_DIR=/home/tokunaga/RMSSimulator
#RESULT_DIR=${BASE_DIR}/output
RESULT_DIR=${BASE_DIR}/test/

for x in mexico africa china ghana india russia
  do
    echo $x
    TEMP_DIR=${BASE_DIR}/test/$x
    echo ${TEMP_DIR}
    mkdir ${TEMP_DIR}
    for i in 1 2 3 4 5 6 7 8 9
      do
        mkdir $RESULT_DIR${x}/${i}
        #別のディレクトリへ対象ファイルを移動
        mv ./test/*${x}*${i}.txt ${TEMP_DIR}/${i}/
      done
  done
#mkdir ${TEMP_DIR}
#mv *russia*.txt ${TEMP_DIR}

#正常終了
exit 0

