require './run.rb'

word_list = %w[setting.txt setting_russia.txt setting_china.txt setting_ghana.txt setting_india.txt setting_africa.txt]

def exec_simulate(simulation_obj,target_file)
  if simulation_obj.setting_file_name == target_file
    simulation_obj.simulation_number.to_i.times do
      simulation_obj.simulate(target_file)
    end
  end
end

main_instance_for_china = Main.new(setting_file_name: "setting_china.txt")
main_instance_for_africa= Main.new(setting_file_name: "setting_africa.txt")
main_instance_for_ghana = Main.new(setting_file_name: "setting_ghana.txt")
main_instance_for_india= Main.new(setting_file_name: "setting_india.txt")
main_instance_for_russia= Main.new(setting_file_name: "setting_russia.txt")
main_instance_for_mexico= Main.new

word_list.each do |file_name|
  for i in 0..1000 do
    exec_simulate(main_instance_for_mexico,file_name)
    sleep(10)
  end
end
