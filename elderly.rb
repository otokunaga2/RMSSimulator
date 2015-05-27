require './markov.rb'
class Elderly < Markov
  def initialize(alpha: nil, beta: nil,gamma: nil,simulation_number: nil,gradient: nil,
                 second_gradient: nil,third_gradient: nil,first_state: nil)
    @state=[0,1]
    @simulation_number = simulation_number
    @gradient=gradient.to_f
    @second_gradient = second_gradient.to_f
    @third_gradient = third_gradient.to_f
    @aging_param=0
    super(first_state)
  end
  def aging(time)
    #p "simulatio time #{time.to_f/@simulation_number.to_f}"
    one_year = 365
    temp_gradient = 0
    case time.to_i
      when 0..one_year*10 then temp_gradient = @gradient.to_f
      when one_year*10+1..one_year*20 then temp_gradient = @second_gradient.to_f
      when one_year*20+1..one_year*30 then temp_gradient = @third_gradient.to_f
    end
    #2jyou no reason wo
    @aging_param = @aging_param.to_f + temp_gradient*(time.to_f/@simulation_number.to_f)**2
    self.q01 = self.q01.to_f + @aging_param.to_f
    # save parameter between 0 and 1
    self.guard_parameter
    self.q10 = self.q10.to_f - @aging_param
    # save parameter between 0 and 1
    self.guard_parameter
    #self.current_state = self.move_state()
    temp_gradient
  end
end
