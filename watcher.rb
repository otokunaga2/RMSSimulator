class Watcher
  attr_reader :fail_ratio,:rondom_value
  HEALTHY_STATE=0
  ILL_STATE=1
  def initialize(healthy_failure_ratio: 0.1, ill_failure_ratio: 0.1)
    @failure_ratio = {:healthy_failure_ratio => healthy_failure_ratio, :ill_failure_ratio => ill_failure_ratio}
  end
  
  def judge_state(state)
    random=Random.rand
    judged_state = nil
    case state.to_i
      when HEALTHY_STATE then
        if random.to_f < @failure_ratio[:healthy_failure_ratio].to_f
          judged_state = HEALTHY_STATE
        else
          judged_state = ILL_STATE
        end
      when ILL_STATE then
        if random.to_f < @failure_ratio[:ill_failure_ratio].to_f
          judged_state = ILL_STATE
        else
          judged_state = HEALTHY_STATE
        end
    end
    judged_state
  end
end
