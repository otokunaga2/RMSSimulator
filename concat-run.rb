require './run.rb'

#todo シミュレーションのデータを初期化するように修正
main_instance = Main.new
for i in 0..100 do
  main_instance.restore_outputfile("")
  main_instance.simulation_number.to_i.times do
    main_instance.simulate
  end
end

#main_instance_for_setting2.simulation_number.to_i.times do
#  main_instance_for_setting2.simulate
#end

