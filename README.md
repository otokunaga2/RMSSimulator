# RMSSimulator
##目的
このシミュレータは高齢者向け見守りサービスをモデル化し、センサの信頼性や高齢者の病気になる頻度などを
シミュレートできます。※詳細については、1の文献をご参照下さい。


##動作確認環境
- os:Arch Linux
- ruby:Ruby 2.2.2p95

##設定ファイルの作成方法
tiny_step_accuracy_changer.shを実行することで、センサ精度を0.0001ずつ変化させた設定ファイルが
conf/india/に生成されます。

## 集計方法
シミュレーションを実行したのちに、以下の手順で集計結果を生成することが出来ます。

>cd  ~/RMSSimulator/output/calc/

> ruby file-mover.rb

> 注意！）この時↑で指定した出力先の対象ファイルがあるかは要確認です．


> cd result

> ruby result-parser.rb


##実行方法
> $ git clone git@github.com:otokunaga2/RMSSimulator.git

> $ cd RMSSimulator 

> $ ruby concat-run.rb

### 設定ファイル（setting.txt）は上のconcat-run.rbから読み込んでいます。パラメータの修正などは上記ファイルを編集する必要があります。


##参考文献
- Seiki Tokunaga, Sinsuke Matsumoto, Sachio Saiki, and Masahide Nakamura, ``How Should Remote Monitoring Sensor Be Accurate?,'' In The 1st International Workshop on Reliability of eHealth Information Systems (ReHIS2014), http:/ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=7001809&abstractAccess=no&userType=inst
