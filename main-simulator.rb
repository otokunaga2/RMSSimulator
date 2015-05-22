require './elderly.rb'
require './watcher.rb'
require './file-reader.rb'
require './output-writer.rb'
require './setting-error.rb'
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

    target_word_list = %w[alpha beta gamma simulation_number 
                          gradient second_gradient third_gradient firststate fail_ill_ratio fail_healthy_ratio]
    @file_read_instance = SettingReader.new("setting.txt",target_word_list)
    @file_read_instance.store_to_hash
    alpha = @file_read_instance.stored_hash["alpha"]
    beta = @file_read_instance.stored_hash["beta"]
    gamma = @file_read_instance.stored_hash["gamma"]
    simulation_number = @file_read_instance.stored_hash["simulation_number"]

    gradient = @file_read_instance.stored_hash["gradient"]
    second_gradient = @file_read_instance.stored_hash["second_gradient"]
    third_gradient = @file_read_instance.stored_hash["third_gradient"]
    #gradient = @file_read_instance.stored_hash["first_gradient"]
    firststate = @file_read_instance.stored_hash["firststate"]
    temp_test = nil
    p "result of check params#{validate_parameters(alpha,beta,gamma,simulation_number,gradient,second_gradient,third_gradient,firststate)}"
    #check the 
    @elderly = Elderly.new(alpha: alpha,beta: beta,gamma: gamma,simulation_number: simulation_number,
                           gradient: gradient,second_gradient: second_gradient,third_gradient: third_gradient,first_state: firststate)
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
      self.write_to_file("#{@elderly.current_state},#{judged_state}\n") 
    end
  end 
  def validate_parameters(*params)
    return_validation=""
    params.each do |param_element|
       return_validation = return_validation && param_element
    end
    unless return_validation == nil
      return_validation
    else
      raise FileSettingError
    end
  end
end

main_instance_val = Main.new

1024.times do
  main_instance_val.simulate
end
