#/bin/bash

#declare -a country_list=("india" "china" "russia" "africa" "ghana" "mexico")
declare -a country_list=("india" "china" "africa")
#_のあとには、国名をあとでくっつける
base_file_name="setting_"
BASE_DIR=/home/tokunaga/RMSSimulator
CONFIG_DIR=/conf
OUTPUT_DIR=/test
BEFORE_SETTING_HEALTY_RATIO=0.5
BEFORE_SETTING_ILL_RATIO=0.85

for temp_country in ${country_list[@]}; do 
  for  i in {700..1000}; do
      mkdir -p $BASE_DIR$CONFIG_DIR"/"$temp_country
      target_copy_file_name=$BASE_DIR$CONFIG_DIR"/"$temp_country"/"$base_file_name${temp_country}"_ac_"$i.txt
      #echo $target_copy_file_name
      cp $BASE_DIR$CONFIG_DIR"/"setting_${temp_country}.txt $target_copy_file_name
      #ill_ratio_value=`expr 10 - $i`
      sed -i -e "s/healthy_ratio:$BEFORE_SETTING_HEALTY_RATIO/healthy_ratio:0.$i/" $target_copy_file_name
      sed -i -e "s/ill_ratio:$BEFORE_SETTING_ILL_RATIO/ill_ratio:0.$i/" $target_copy_file_name
  done;
done;
##function make_dir_with_step(){
#	for temp_country in ${country_list[@]}; do 
#	  for  i in {700..1000}; do
#       mkdir -p $BASE_DIR$OUTPUT_DIR/$temp_country/$i
#       # echo $i
#	  done;
#	done;
#}
function convert_to_dicimal(){
		"scale=5; ${0}/100" | bc| DECIMAL_NUMBER
    echo ${DECIMAL_NUMBER}
    return ${DECIMAL_NUMBER}
}
function inc_sensor_accuracy(){
	accuracy=70
	while [ ${accuracy} -le 100 ]
	do
		decimal_number=
		# memo :bcコマンドに渡すことで小数点演算ができる
		 echo "scale=5; ${accuracy}/100" | bc 
		let accuracy=${accuracy}+1
	done
			
}
#make_dir_with_step
#inc_sensor_accuracy
#convert_to_dicimal 12
