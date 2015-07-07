class Watcher
  attr_reader :fail_ratio,:rondom_value
  HEALTHY_STATE=0
  ILL_STATE=1
  def initialize(ratio_healthy_failure: 0.1, ratio_ill_failure: 0.1)
    @fail_ratio = {:ratio_healthy_failure => ratio_healthy_failure, :ratio_ill_failure => ratio_ill_failure}
  end
  
  def judge_state(state)
    random=Random.rand
    judged_state = nil
    case state.to_i
      when HEALTHY_STATE then
        if random.to_f < @fail_ratio[:ratio_healthy_failure].to_f
          judged_state = ILL_STATE
        else
          judged_state = HEALTHY_STATE
        end
      when ILL_STATE then
        if random.to_f < @fail_ratio[:ratio_ill_failure].to_f
          judged_state = HEALTHY_STATE
        else
          judged_state = ILL_STATE
        end
    end
    judged_state
  end
end
