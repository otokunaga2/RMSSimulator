class Watcher
  attr_accessor :fail_ratio
  def initialize(fail_ratio)
    @fail_ratio = fail_ratio
  end

  def watch(default_accuracy=0.5,target)

  end
  def judge_state(state)
    judged_state = nil
    case state.to_i
      when 0 then
         
        p "0dayo"
      when 1 then
        p "1dao"
      end
    end
    return judged_state
  end
end
