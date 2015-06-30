#class SettingException < Exception; end
#raise SettingException, "setting exception" #=> format error. (SettingException)
class Watcher
  attr_reader :fail_ratio,:rondom_value
  def initialize(fail_ratio)
    @fail_ratio = fail_ratio
    p @fail_ratio
    @rand_instance = Random.new(1)
  end
  def generate_random
    random_seed= Random.new(1)
  end

  #state is now target_elderly state 0 or 1
  def judge_state(state)
    judged_state = nil
    @random_value = generate_random
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
    p judged_state
    judged_state
  end
end
