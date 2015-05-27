require './run.rb'

main_instance = Main.new
main_instance.simulation_number.to_i.times do
  main_instance.simulate
end

main_instance.restore_outputfile(file_name: "setting2.txt")
main_instance.simulation_number.to_i.times do
  main_instance.simulate
end

