class Markov

  attr_reader :current_state, :q01, :q10
def initialize(alpha,beta,gamma,initial_state)
  @q01=alpha
  @q10=gamma
  @q00=1-@q01
  @q11=1-@q10
  @random = Random.new(Time.now.to_i)
  @current_state=initial_state
end
def guard_parameter
  if @q01 > 0.9999
    @q01 = 0.9999
  end
  if @q10 > 0.9999
    @q10 = 0.9999
  elsif @q10 < 0
    @q10 = 0.0001
  end
end
def move_another_state()
  random=@random.rand()
  state = @current_state
  case state
  when 0 then
  if random.to_f < @q01.to_f then
  @current_state=1
  elsif @q01.to_f < random.to_f then
  @current_state=0
  end
  when 1 then
  if random.to_f < @q10.to_f
  @current_state=0
  elsif @q10.to_f < random.to_f then
  @current_state=1
  end


  end

  end

  end
