require './run.rb'

#シミュレーションを実行するインスタンスを格納するためのリスト
main_instance_list = []
country_name_list = []
country_name_list.push("india")
#country_name_list.push("mexico")
#country_name_list.push("ghana")
#country_name_list.push("russia")
country_name_list.push("china")
#country_name_list.push("africa")
COUNTRY_NAME="india"
#シミュレーションを実行するインスタンスの生成
country_name_list.each do | country_name|
  for i in 1..10 do
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'1.txt'))
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'2.txt'))
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'3.txt'))
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'4.txt'))
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'5.txt'))
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'6.txt'))
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'7.txt'))
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'8.txt'))
    main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'9.txt'))
  end

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
