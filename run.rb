require './elderly.rb'
require './watcher.rb'
require './file-reader.rb'
require './file-writer.rb'
require './setting-error.rb'
class Main
  attr_accessor :time, :elderly, :simulation_number, :current_target_file, :setting_file_name
  include OutputWriter
  def initialize(setting_file_name: 'simulation_setting/setting.txt')
    #default setting
    @setting_file_name = setting_file_name
    @time = 0
    target_word_list = %w[alpha beta gamma simulation_number 
                          gradient second_gradient third_gradient firststate
                          fail_ill_ratio fail_healthy_ratio]
    @file_read_instance = SettingReader.new("setting.txt",target_word_list)
    @file_read_instance.store_to_hash
    alpha = @file_read_instance.stored_hash["alpha"]
    beta = @file_read_instance.stored_hash["beta"]
    gamma = @file_read_instance.stored_hash["gamma"]
    @simulation_number = @file_read_instance.stored_hash["simulation_number"]
    p @simulation_number
    gradient = @file_read_instance.stored_hash["gradient"]
    second_gradient = @file_read_instance.stored_hash["second_gradient"]
    third_gradient = @file_read_instance.stored_hash["third_gradient"]
    firststate = @file_read_instance.stored_hash["firststate"]
    @elderly = Elderly.new(alpha: alpha,beta: beta,gamma: gamma,
                           simulation_number: @simulation_number,
                           gradient: gradient,second_gradient: second_gradient,
                           third_gradient: third_gradient,first_state: firststate)
    @time = 0
    fail_healthy_ratio= @file_read_instance.stored_hash["fail_healthy_ratio"]
    fail_ill_ratio = @file_read_instance.stored_hash["fail_ill_ratio"]
    @random_instance = Random.new(1)
    set_hash(fail_healthy_ratio,fail_ill_ratio)
    #creating for the output file

    #self.create_file(nil)
    create_file(prefix: @setting_file_name,file_name: nil)
  end
  def restore_outputfile(file_name: nil)
    @setting_file_name = file_name
    create_file(prefix: @setting_file_name ,file_name: nil)
    @current_target_file = @target_name
  end
  def create_file(prefix: nil,file_name: "setting.txt")
    now = Time.now.strftime("%Y-%m-%d-%S")
    unless file_name != nil
      file_name = prefix << "#{now}.txt"
    end
    @target_name = "output/" << file_name
    FileUtils.touch(@target_name)
    @current_target_file = @target_name
  end
  
  def set_hash(healthy,ill)
    @watcher_init_ratio_map = {}
    @watcher_init_ratio_map = {:healthy => healthy, :ill => ill}
  end

  def simulate
    @watcher = Watcher.new(@watcher_init_ratio_map)
    judged_state = @watcher.judge_state(@elderly.current_state)
    @time=@time+1
    @elderly.current_state = 0
    @elderly.aging(@time)
    @elderly.move_state()
    if @elderly.current_state == nil
    else
      self.write_to_file(@current_target_file,"#{@elderly.current_state},#{judged_state}\n") 
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
