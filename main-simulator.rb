require './elderly.rb'
require './watcher.rb'
require './file-reader.rb'
require './file-writer.rb'
class Main
  attr_accessor :time, :elderly
  include OutputWriter
  def initialize(setting_file_name: 'setting.txt')
    @time = 0
    target_word_list = %w[alpha beta gamma simulation_number gradient firststate fail_ill_ratio fail_healthy_ratio]
    @file_read_instance = SettingReader.new(setting_file_name,target_word_list)
    @file_read_instance.store_to_hash
    alpha = @file_read_instance.stored_hash["alpha"]
    beta = @file_read_instance.stored_hash["beta"]
    gamma = @file_read_instance.stored_hash["gamma"]
    @simulation_number = @file_read_instance.stored_hash["simulation_number"]

    gradient = @file_read_instance.stored_hash["gradient"]
    firststate = @file_read_instance.stored_hash["firststate"]
    @elderly = Elderly.new(alpha,beta,gamma,@simulation_number,gradient,firststate)
    fail_healthy_ratio= @file_read_instance.stored_hash["fail_healthy_ratio"]
    fail_ill_ratio = @file_read_instance.stored_hash["fail_ill_ratio"]
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
      self.write_to_file("eldery_state:#{@elderly.current_state},judged_state:#{judged_state}\n") end
  end 
end

main_instance_val = Main.new

@simulation_number.to_i.times do
  main_instance_val.simulate
end
