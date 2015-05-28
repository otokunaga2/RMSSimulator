require './run.rb'

main_instance = Main.new
main_instance.simulation_number.to_i.times do
  main_instance.simulate
end

main_instance_for_setting2 = Main.new(setting_file_name: "setting2.txt")
main_instance_for_setting2.simulation_number.to_i.times do
  main_instance_for_setting2.simulate
end

