#!/bin/sh

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

function setup_dir(){
  i=0
  j=70
  for x in mexico africa china ghana india russia
    do
      TEMP_DIR=${BASE_DIR}/test/sensor/$x
      #mkdir ${TEMP_DIR}
      #精度別の結果を格納するためのディレクトリ作成
      while [ $j -lt 100 ]
      do 
        mkdir -p ${BASE_DIR}/test/sensor/$x/$j 2>/dev/null
        j=`expr $j + 1`
      done
  done
  return 1
}
setup_dir
j=70
while [ $j -lt 100 ]
do
  #センサ精度などを表したりする
  for x in mexico africa china ghana india russia
    do
      TEMP_DIR=${BASE_DIR}/test/sensor/$x
      echo ${TEMP_DIR}
      #別のディレクトリへ対象ファイルを移動
      mv ${BASE_DIR}/test/*${x}*_${j}.txt ${BASE_DIR}/test/hoge
    done
  j=`expr $j + 1`
done
#mkdir ${TEMP_DIR}
#mv *russia*.txt ${TEMP_DIR}

#正常終了
exit 0

