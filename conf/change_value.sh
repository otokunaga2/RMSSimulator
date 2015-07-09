#/bin/bash

declare -a country_list=("india" "china" "russia" "africa" "ghana" "mexico")
#_のあとには、国名をあとでくっつける
base_file_name="setting_"

BEFORE_SETTING_HEALTY_RATIO=0.5
BEFORE_SETTING_ILL_RATIO=0.85

for temp_country in ${country_list[@]}; do 
  echo $temp_country
  for  i in {1..9}; do
      ill_ratio_value=`expr 10 - $i`
      echo $ill_ratio_value
      sed -i -e "s/healthy_ratio:$BEFORE_SETTING_HEALTY_RATIO/healthy_ratio:0.$i/" $base_file_name$temp_country$i.txt
      sed -i -e "s/ill_ratio:$BEFORE_SETTING_ILL_RATIO/ill_ratio:0.$ill_ratio_value/" $base_file_name$temp_country$i.txt
  done;
done;
