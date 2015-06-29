#/bin/sh

base_dir=/home/tokunaga/RMSSimulator/output
for temp_conutry_name in africa russia ghana 
  do 
    echo $temp_conutry_name
    cd ${base_dir}/$temp_conutry_name
    #生成したシミュレーション結果の削除
    rm *.txt
    #ls | echo
  done

