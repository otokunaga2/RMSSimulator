require './markov.rb'
class Elderly < Markov
  def initialize(alpha,beta,gamma,simulation_number,gradient)
    @state=[0,1]
    @simulation_number = simulation_number
    @gradient=gradient
    @aging_param=0
    @q10=q10
    @q01=q01
    #@current_state=0
    super(alpha,beta,gamma,q10,q01,initial_state)
  end
  def aging(time)
    p "simulation steps #{time}"
    #p "simulatio time #{time.to_f/@simulation_number.to_f}"
    p @aging_param = @aging_param + @gradient*(time.to_f/@simulation_number.to_f)**2
    @q01 = @q01 + @aging_param
    self.guard_parameter
    p "@q01 #{@q01}"
    @q10 = @q10 - @aging_param
    self.guard_parameter
    p "@q01 #{@q10}"
  end
  

end

