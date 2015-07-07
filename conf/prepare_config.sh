#/bin/bash

#設定ファイル名を複数用意する
#setting_ghana.txtからsetting_ghana1.txt setting_ghana2.txt...
./copy_setting_files.sh
#生成したファイルの書き換えを行う
./change_value.sh
