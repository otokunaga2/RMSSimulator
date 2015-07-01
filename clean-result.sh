#/bin/sh

base_dir=/home/tokunaga/work/RMSSimulator/output
for temp_conutry_name in africa russia ghana india china
  do 
    echo $temp_conutry_name
    cd ${base_dir}/$temp_conutry_name
    #生成したシミュレーション結果の削除
    rm *.txt
    #ls | echo
  done

