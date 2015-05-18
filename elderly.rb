require './markov.rb'
class Elderly < Markov
  def initialize(alpha,beta,gamma,simulation_number,gradient,initial_state)
    @state=[0,1]
    @simulation_number = simulation_number
    @gradient=gradient.to_f
    @aging_param=0
    #@current_state=0
    super(alpha,beta,gamma,initial_state)
  end
  def aging(time)
    #p "simulatio time #{time.to_f/@simulation_number.to_f}"
    @aging_param = @aging_param.to_f + @gradient.to_f*(time.to_f/@simulation_number.to_f)**2
    self.q01 = self.q01.to_f + @aging_param.to_f
    p "aging parameter" << @aging_param.to_s
    # save parameter between 0 and 1
    self.guard_parameter
    self.q10 = self.q10.to_f - @aging_param
    # save parameter between 0 and 1
    self.guard_parameter
    #self.current_state = self.move_state()
  end
end

