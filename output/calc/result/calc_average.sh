#!/bin/sh

#declare -a country_list=("india" "china" "russia" "africa" "ghana" "mexico")
declare -a country_list=("china")

#５年ごとに集計されたファイルの平均値を算出して、外部ファイルに吐き出す
function calc_average(){
  _country=$1
  _file_index=$2
  _years=$3
  cat ./result$_country$_file_index*_$_years"Y".csv | awk 'BEGIN{FS = ","}{k+=$1}{l+=$2}{m+=$3}{n+=$4}END{print k/NR,l/NR,m/NR,n/NR}' >> ./counting/$_country/$_years/$_years\_result$_country$_file_index.csv
}
for country in ${country_list[@]}; 
do
  for i in {700..1000} 
  do
    for years in 1825 3650 5475 7300 9125 10950
    do
      calc_average $country $i $years
    done
  done
done



