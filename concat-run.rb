require './run.rb'

#シミュレーションを実行するインスタンスを格納するためのリスト
main_instance_list = []
country_name_list = ["ghana"] #シミュレーション対象の国を設定する
#シミュレーションを実行するインスタンスの生成
index_list=[]
country_name_list.each do | country_name|
  p country_name
  main_instance_list.push(Main.new(init_setting_file_name: "./conf/setting_#{country_name}.txt"))
end
   # main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'2.txt'))
   # main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'3.txt'))
   # main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'4.txt'))
   # main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'5.txt'))
   # main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'6.txt'))
   # main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'7.txt'))
   # main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'8.txt'))
   # main_instance_list.push(Main.new(init_setting_file_name: 'setting_'+country_name+'9.txt'))

def exec_simulation(main_instance)
  #main_instance.restore_outputfile(prefix: "setting.txt")
  #設定ファイルに設定されたシミュ-レーション回数分、シミュレーションを実行
	
  main_instance.simulation_number.to_i.times do
    main_instance.simulate
  end
end
p main_instance_list.length
#格納されたリストの数だけ、シミュレーション結果をファイルとして生成
main_instance_list.each do |main_instance|
  exec_simulation(main_instance)  
end
