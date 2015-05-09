require './markov.rb'
class Elderly < Markov
  def initialize(alpha,beta,gamma,simulation_number,gradient,initial_state)
    @state=[0,1]
    @simulation_number = simulation_number
    @gradient=gradient.to_f
    @aging_param=0
    @q10=q10
    @q01=q01
    #@current_state=0
    super(alpha,beta,gamma,initial_state)
  end
  def aging(time)
    p "simulation steps #{time}"
    #p "simulatio time #{time.to_f/@simulation_number.to_f}"
    @aging_param = @aging_param.to_f + @gradient.to_f*(time.to_f/@simulation_number.to_f)**2
    @q01 = @q01.to_f + @aging_param.to_f
    self.guard_parameter
    p "@q01 #{@q01}"
    @q10 = @q10.to_f - @aging_param
    self.guard_parameter
    p "@q10 #{@q10}"

    p "state :#{self.current_state}"
  end
  

end

