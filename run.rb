require './elderly.rb'
require './watcher.rb'
require './file-reader.rb'
require './file-writer.rb'
require './setting-error.rb'

class Main
  attr_accessor :time, :elderly, :simulation_number, :current_target_file, :setting_file_name
  BASE_DIR="./output"
  def initialize(init_setting_file_name: 'setting.txt', target_country: '')
    @time = 0
    @random_instance = Random.new(1)
    @watcher_init_ratio_map = {}
    @current_target_country= target_country
    init_property(setting_file_name: init_setting_file_name, target_country: target_country)
  end

  #設定ファイルから変数に格納するための初期化関数
  def init_property(setting_file_name: 'setting.txt', target_country: '')
    target_word_list = %w[alpha q01 q10 y simulation_number 
                          gradient second_gradient third_gradient firststate
                          fail_ill_ratio fail_healthy_ratio]
    file_read_instance = SettingReader.new(setting_file_name,target_word_list)
    file_read_instance.store_to_hash
    alpha = file_read_instance.stored_hash["alpha"]
    y     = file_read_instance.stored_hash["y"]
    q01   = file_read_instance.stored_hash["q01"]
    q10   = file_read_instance.stored_hash["q10"]
    @simulation_number = file_read_instance.stored_hash["simulation_number"]
    gradient        = file_read_instance.stored_hash["gradient"]
    firststate      = file_read_instance.stored_hash["firststate"]
    @elderly = Elderly.new(alpha: alpha, y: y, q01: q01, q10: q10,
                           simulation_number: @simulation_number,
                           gradient: gradient, first_state: firststate)
    healthy_failure_ratio = file_read_instance.stored_hash["fail_healthy_ratio"]
    ill_failure_ratio = file_read_instance.stored_hash["fail_ill_ratio"]
    output_file_dir=BASE_DIR + "/" + @current_target_country + "/"
    base_file_name = File.basename(setting_file_name, ".txt")
    @current_target_file = OutputWriter.instance.create_file(setting_file_name: base_file_name,output_dir_prefix: output_file_dir,target_country: @current_target_country)
    #@watcher = Watcher.new(@watcher_init_ratio_map)
    @watcher = Watcher.new(healthy_failure_ratio: healthy_failure_ratio , ill_failure_ratio: ill_failure_ratio)
  end


  #シミュレーション実行のメイン部分
  #ここで、高齢者の加齢 -> 加齢とともに病気になりやすくなるなどを表現
  def simulate

    #シミュレーションの高齢化を表す
    @time=@time+1
    @elderly.aging(@time)
    @elderly.current_state = @elderly.move_state()
    #
    judged_state = @watcher.judge_state(@elderly.current_state)
    unless @elderly.current_state == nil
      OutputWriter.instance.write_to_file(@current_target_file,@current_target_country,"#{judged_state},#{@elderly.current_state}\n")
    else
      p "高齢者の現在状態がありません！"
      raise ElerlyElderlyStateNotFoundError 
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
