#!/bin/sh

declare -a country_list=("india" "china" "russia" "africa" "ghana" "mexico")
BASE_DIR=/home/tokunaga/RMSSimulator/output
for temp_country in ${country_list[@]}; do 
	mkdir -p ${BASE_DIR}/${temp_country}
done;

