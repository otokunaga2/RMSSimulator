class Markov
  attr_accessor :current_state, :q01, :q10
  def initialize(alpha,beta,gamma,initial_state)
    @q01=alpha
    @q10=gamma
    #@q00=1-@q01
    #@q11=1-@q10
    @random = Random.new(Time.now.to_i)
    @current_state=initial_state
  end
  def guard_parameter
    if @q01.to_f > 0.9999
      @q01 = 0.9999
    end
    if @q10.to_f > 0.9999
      @q10 = 0.9999
    elsif @q10.to_f < 0
      @q10 = 0.0001
    end
  end
  def move_state(random=@random.rand())
    #p random=@random.rand()
    p "random val is " << random.to_s
    p "q01" << @q01.to_s
    p "q10" << @q10.to_s

    case @current_state
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
