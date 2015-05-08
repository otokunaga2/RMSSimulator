module Markov
def initialize(q01,q10)
  @q01=q01
  @q10=q10
  @q00=1-@q01
  @q11=1-@q10
  p "including markov"
  end
def move_another_state(state,random)
  case state
  when 0 then
    if random.to_f < @q01.to_f then
    @current_state=1
    elsif @q01.to_f < random.to_f then
    @current_state=0
  end
  when 1 then
    if random.to_f < @q10.to_f
    elsif @q10.to_f < random.to_f then
  end





  end

  end

  end
