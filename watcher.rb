class Watcher
  attr_reader :fail_ratio,:rondom_value
  def initialize(fail_ratio)
    @fail_ratio = fail_ratio
  end

  def judge_state(state)
    random=Random.rand
    judged_state = nil
    case state.to_i
      when 0 then
        if random.to_f < fail_ratio[:healthy].to_f
          judged_state = 1
        else
          judged_state = 0
        end
      when 1 then
        if random.to_f < fail_ratio[:ill].to_f
          judged_state =  0
        else
          judged_state = 0
        end
    end
    judged_state
  end
end
