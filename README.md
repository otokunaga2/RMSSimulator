# RMSSimulator
##目的
このシミュレータは高齢者向け見守りサービスをモデル化し、センサの信頼性や高齢者の病気になる頻度などを
シミュレートできます。※詳細については、1の文献をご参照下さい。


##動作確認環境
-Ruby 2.2.2p95

##実行方法
$ git clone this repositry
$ cd RMSSimulator
$ ruby concat-run.rb
設定ファイル（setting.txt）は上のconcat-run.rbから読み込んでいます。
パラメータの修正などは上記ファイルを編集する必要があります。


##参考文献
1.Seiki Tokunaga et.al ``How should remote monitoring sensor be accurate?'', http:/ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=7001809&abstractAccess=no&userType=inst
