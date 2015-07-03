require './run.rb'

#シミュレーションを実行するインスタンスを格納するためのリスト
main_instance_list = []
#シミュレーションを実行するインスタンスの生成
for i in 1..100 do
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china2.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china3.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china4.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china5.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china6.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china7.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china8.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china9.txt'))
#  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china_10.txt'))
# main_instance_list.push(Main.new(init_setting_file_name: 'setting_china_11.txt'))
#  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china_12.txt'))
#  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china_13.txt'))
#  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china_14.txt'))
#  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china_15.txt'))
#  main_instance_list.push(Main.new(init_setting_file_name: 'setting_china_16.txt'))
end

def exec_simulation(main_instance)
  #main_instance.restore_outputfile(prefix: "setting.txt")
  #設定ファイルに設定されたシミュ-レーション回数分、シミュレーションを実行
  main_instance.simulation_number.to_i.times do
    main_instance.simulate
  end
end

#格納されたリストの数だけ、シミュレーション結果をファイルとして生成
main_instance_list.each do |main_instance|
  exec_simulation(main_instance)  
end
