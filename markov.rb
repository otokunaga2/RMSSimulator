class Markov
  attr_reader :current_state
def initialize(alpha,beta,gamma,q01,q10,before_state)
  @alpha=alpha
  @beta=beta
  @gamma=gamma

  @q01=q01
  @q10=q10
  @q00=1-@q01
  @q11=1-@q10
  @random = Random.new(Time.now.to_i)
  @current_state=before_state
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
