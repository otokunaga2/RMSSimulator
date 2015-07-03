require './run.rb'

#シミュレーションを実行するインスタンスを格納するためのリスト
main_instance_list = []
COUNTRY_NAME="india"
#シミュレーションを実行するインスタンスの生成
for i in 1..100 do
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'1.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'2.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'3.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'4.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'5.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'6.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'7.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'8.txt'))
  main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+COUNTRY_NAME+'9.txt'))
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
