#/bin/sh

######################################################
#
#このスクリプトは大量に生成されるシミュレーション結果を
#別ディレクトリへ移動することを目的としています
#
#created at 2015/06/05
#author tokunaga
######################################################

if [ $# -eq 0 ]; then
  echo '引数を入力してください'
  exit 1
fi

if [ $# -eq 1 ]; then
  echo 'ok'
else
  echo '引数の数が多すぎます。引数の数は1です。'
  exit 1
fi

BASE_DIR=/home/tokunaga/RMSSimulator

RESULT_DIR=${BASE_DIR}/output
TEMP_DIR=${BASE_DIR}/output/$1
mkdir ${TEMP_DIR}
cd ${RESULT_DIR}
mv *.txt ${TEMP_DIR}

