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
RESULT_DIR=${BASE_DIR}/output

for x in mexico africa china ghana india russia
  do
    echo $x
    TEMP_DIR=${BASE_DIR}/output/$x
    echo ${TEMP_DIR}
    mkdir ${TEMP_DIR}
    mv ./output/*${x}*.txt ${TEMP_DIR}/
  done
#mkdir ${TEMP_DIR}
#mv *russia*.txt ${TEMP_DIR}

#正常終了
exit 0

