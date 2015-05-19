class SettingException < Exception
  raise SettingException, "setting exception" #=> format error. (SettingException)
end
class Watcher
  attr_reader :fail_ratio
  def initialize(fail_ratio)
    @fail_ratio = fail_ratio
    if @fail_ratio[:healthy].to_i > @fail_ratio[:ill].to_i
    #do nothing
    else
      raise SettingException
    end
    @rand_instance = Rand.new(1)
  end
  #elderly_states => [0,1,....]
  #state is now target_elderly state 0 or 1
  def judge_state(state,elderly_states,random_seed= Rand.new(1))
    judged_state = nil
    #@random_value = @rand_instance.rand()
    @random_value = 0
    case state.to_i
      when 0 then
        if @randowm_value.to_f < fail_ratio[:healthy].to_f
          judged_state = 1
        else
          judged_state = 0
        end
      when 1 then
        if @randowm_value.to_f < fail_ratio[:ill].to_f
          judged_state =  0
        else
          judged_state = 0
        end
    end
    judged_state
  end
end
watcher_instance = Watcher.new({:healthy =>0.7,:ill =>0.4})
