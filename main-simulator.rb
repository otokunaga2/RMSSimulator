require './elderly.rb'
require './watcher.rb'
require './file-reader.rb'
require './output-writer.rb'
class Main
  attr_accessor :time, :elderly
  include OutputWriter
  def initialize
   #alpha:0.2 
   #beta:0.123
   #gamma:0.14
   #simulation_number:1000
   #gradient:0.0005
   #firststate:0
   #fail_healthy_ratio:0.8
   #fail_ill_ratio:0.65

    target_word_list = %w[alpha beta gamma simulation_number gradient firststate fail_ill_ratio fail_healthy_ratio]
    @file_read_instance = SettingReader.new("setting.txt",target_word_list)
    @file_read_instance.store_to_hash
    alpha = @file_read_instance.stored_hash["alpha"]
    beta = @file_read_instance.stored_hash["beta"]
    gamma = @file_read_instance.stored_hash["gamma"]
    simulation_number = @file_read_instance.stored_hash["simulation_number"]

    gradient = @file_read_instance.stored_hash["gradient"]
    firststate = @file_read_instance.stored_hash["firststate"]
    firststate = 0
    @elderly = Elderly.new(alpha,beta,gamma,simulation_number,gradient,firststate)
    @time = 0
    fail_healthy_ratio= @file_read_instance.stored_hash["fail_healthy_ratio"]
    fail_ill_ratio = @file_read_instance.stored_hash["fail_ill_ratio"]
    #seed set as time
    @random_instance = Random.new(1)
    setting_hash(fail_healthy_ratio,fail_ill_ratio)
  end
  def setting_hash(healthy,ill)
    @watcher_init_ratio_map = {}
    @watcher_init_ratio_map = {:healthy => healthy, :ill => ill}
  end

  def simulate
    self.create_file('output')
    @watcher = Watcher.new(@watcher_init_ratio_map)
    judged_state = @watcher.judge_state(@elderly.current_state)
    @time=@time+1
    @elderly.current_state = 0
    @elderly.aging(@time)
    @elderly.move_state()
    if @elderly.current_state == nil
    else
<<<<<<< HEAD
      #self.write_to_file("eldery state:#{@elderly.current_state},judged_state:#{judged_state}\n") end
      self.write_to_file("#{@elderly.current_state},#{judged_state}\n") end
=======
      self.write_to_file("eldery_state:#{@elderly.current_state},judged_state:#{judged_state}\n") end
>>>>>>> fixing result parser
  end 
end

main_instance_val = Main.new

1024.times do
  main_instance_val.simulate
end
