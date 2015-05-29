require './run.rb'

word_list = %w[setting_russia.txt setting_china.txt setting_ghana.txt setting_india.txt setting_africa.txt]
word_list.each do |word|
  p word
end
def exec_simulate(simulation_obj)
  simulation_obj.simulation_number.to_i.times do
    simulation_obj.simulate("setting_china.txt")
  end
end

main_instance_for_china = Main.new(setting_file_name: "setting_china.txt")
main_instance_for_africa= Main.new(setting_file_name: "setting_africa.txt")
main_instance_for_ghana = Main.new(setting_file_name: "setting_ghana.txt")
main_instance_for_india= Main.new(setting_file_name: "setting_india.txt")
main_instance_for_russia= Main.new(setting_file_name: "setting_russia.txt")
main_instance_for_mexico= Main.new
#for i in 0..1000 do
  exec_simulate(main_instance_for_mexico)
  exec_simulate(main_instance_for_china)
  exec_simulate(main_instance_for_africa)
  exec_simulate(main_instance_for_ghana)
  exec_simulate(main_instance_for_india)
  exec_simulate(main_instance_for_russia)
#  sleep(10)
#end
