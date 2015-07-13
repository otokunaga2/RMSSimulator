#!/bin/sh

declare -a country_list=("india" "china" "russia" "africa" "ghana" "mexico")

for i in {1..3} 
do
  cat ./sample-data/sample$i.csv | awk 'BEGIN{FS = ","}{k+=$1}{l+=$2}{m+=$3}{n+=$4}END{print k/NR,l/NR,m/NR,n/NR}' > result$i.csv
done


