require './elderly.rb'
require './watcher.rb'
require './file-reader.rb'
require './file-writer.rb'
require './setting-error.rb'

class Main
  attr_accessor :time, :elderly, :simulation_number, :current_target_file, :setting_file_name
  def initialize(init_setting_file_name: 'setting.txt')
    @time = 0
    @random_instance = Random.new(1)
    #set_hash(fail_healthy_ratio,fail_ill_ratio)
    init_property(setting_file_name: init_setting_file_name)
  end

  #設定ファイルから変数に格納するための初期化関数
  def init_property(setting_file_name: 'setting.txt')
    #p setting_file_name
    target_word_list = %w[alpha beta gamma simulation_number 
                          gradient second_gradient third_gradient firststate
                          fail_ill_ratio fail_healthy_ratio]
    file_read_instance = SettingReader.new(setting_file_name,target_word_list)
    file_read_instance.store_to_hash
    alpha = file_read_instance.stored_hash["alpha"]
    beta  = file_read_instance.stored_hash["beta"]
    gamma = file_read_instance.stored_hash["gamma"]
    @simulation_number = file_read_instance.stored_hash["simulation_number"]
    gradient        = file_read_instance.stored_hash["gradient"]
    second_gradient = file_read_instance.stored_hash["second_gradient"]
    third_gradient  = file_read_instance.stored_hash["third_gradient"]
    firststate      = file_read_instance.stored_hash["firststate"]
    @elderly = Elderly.new(alpha: alpha,beta: beta,gamma: gamma,
                           simulation_number: @simulation_number,
                           gradient: gradient,second_gradient: second_gradient,
                           third_gradient: third_gradient,first_state: firststate)
    fail_healthy_ratio= file_read_instance.stored_hash["fail_healthy_ratio"]
    fail_ill_ratio = file_read_instance.stored_hash["fail_ill_ratio"]
    set_hash(fail_healthy_ratio,fail_ill_ratio)
    @current_target_file = OutputWriter.instance.create_file(prefix: setting_file_name)
  end

  def set_hash(healthy,ill)
    @watcher_init_ratio_map = {}
    @watcher_init_ratio_map = {:healthy => healthy, :ill => ill}
  end

  #シミュレーション実行のメイン部分
  #ここで、高齢者の加齢 -> 加齢とともに病気になりやすくなるなどを表現
  def simulate
    @watcher = Watcher.new(@watcher_init_ratio_map)
    judged_state = @watcher.judge_state(@elderly.current_state)
    @time=@time+1
    @elderly.aging(@time)
    @elderly.move_state()
    unless @elderly.current_state == nil
      OutputWriter.instance.write_to_file(@current_target_file,"#{@elderly.current_state},#{@elderly.q01},#{@elderly.q10}\n") 
    else
      p "高齢者の現在状態がありません！"
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
