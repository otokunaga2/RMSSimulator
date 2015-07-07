#/bin/bash

declare -a array=("china" "russia" "africa" "ghana" "mexico" "india")
i=0
for e in ${array[@]}; do
    #echo "array[$i] = ${e}"
    for i in {1..9}; do
      cp setting_${e}.txt setting_${e}$i.txt
    done;
        
let i++
done;

