#/bin/bash

base_file_name="setting_india"
BEFORE_SETTING_HEALTY_RATIO=0.8
BEFORE_SETTING_ILL_RATIO=0.65
echo $base_file_name
for  i in {1..9}; do
    ill_ratio_value=`expr 10 - $i`
    echo $ill_ratio_value
    sed -i -e "s/healthy_ratio:$BEFORE_SETTING_HEALTY_RATIO/healthy_ratio:0.$i/" $base_file_name$i.txt
    sed -i -e "s/ill_ratio:$BEFORE_SETTING_ILL_RATIO/ill_ratio:0.$ill_ratio_value/" $base_file_name$i.txt
done;
