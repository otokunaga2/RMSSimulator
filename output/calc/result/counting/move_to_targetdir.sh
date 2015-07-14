#!/bin/sh

TARGET_DIR=counting
HOME_DIR=/home/tokunaga/RMSSimulator/output/calc/result
#declare -a country_list=("india" "china" "russia" "africa" "ghana" "mexico")
declare -a country_list=("china")
declare -a targetdir_list=("1825" "3650" "5475" "7300" "9125" "10950")
function setup_target_dir(){
  for _country in ${country_list[@]};
    do
    for _target_dir in ${targetdir_list[@]};
      do
        mkdir -p ./$_country/$_target_dir/
      done
    done
}
function move_file_to_dir(){
  for _country in ${country_list[@]};
    do
    #移動させたいディレクトリresultghana817_10950Y.csv
    for _target_dir in ${targetdir_list[@]};
    do
      #result_mexico*3650Y.csv
      #3650_resultmexico819.csv
      mv ./$_country/$_target_dir"_result"$_country*.csv ./$_country/$_target_dir
    done
  done
}
setup_target_dir
move_file_to_dir
