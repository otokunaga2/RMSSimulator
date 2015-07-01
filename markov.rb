class Markov
  attr_accessor :current_state, :q01, :q10
  def initialize(initial_state=0)
    @current_state=initial_state
  end
  def guard_parameter
    if @q01.to_f > 0.9999
      @q01 = 1
    end
    if @q10.to_f > 0.9999
      @q10 = 0.9999
    elsif @q10.to_f < 0
      @q10 = 0
    end
  end
  def move_state(random=Random.rand())
    case @current_state.to_i
      when 0 then
        if random.to_f < @q01.to_f then
          @current_state=1
        else
          @current_state=0
        end
      when 1 then
        if random.to_f < @q10.to_f
          @current_state=0
        elsif @q10.to_f < random.to_f then
          @current_state=1
        end
    end
    @current_state
  end
end
