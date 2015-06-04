require './run.rb'

main_instance_list = []
for i in 0..1000 do
  main_instance_list.push(Main.new(init_setting_file_name: 'setting.txt'))
end

def exec_simulation(main_instance)
  main_instance.restore_outputfile(prefix: "setting.txt")
  main_instance.simulation_number.to_i.times do
    main_instance.simulate
  end
end

main_instance_list.each do |main_instance|
  exec_simulation(main_instance)  
end
