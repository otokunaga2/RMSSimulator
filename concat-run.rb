require './run.rb'

#シミュレーションを実行するインスタンスを格納するためのリスト
main_instance_list = []

#シミュレーションに利用する設定ファイル名を格納
setting_file_name = 'setting_ghana.txt'


#シミュレーションを実行するインスタンスの生成(シミュレーションを回す数だけ用意)
for i in 0..100 do
  main_instance_list.push(Main.new(init_setting_file_name: setting_file_name))
end

def exec_simulation(main_instance)
  #設定ファイルに設定されたシミュ-レーション回数分、シミュレーションを実行
  main_instance.simulation_number.to_i.times do
    main_instance.simulate
  end
end

#格納されたリストの数だけ、シミュレーション結果をファイルとして生成
main_instance_list.each do |main_instance|
  exec_simulation(main_instance)  
end
