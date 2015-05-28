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
    @alpha = alpha
    super(first_state)
  end
  def aging(time)
    one_year = 365
    temp_gradient = 0
    case time.to_i
      when 0..one_year*10 then temp_gradient = @gradient.to_f
      when one_year*10+1..one_year*10*2 then temp_gradient = @second_gradient.to_f
      when one_year*10*2+1..one_year*10*3 then temp_gradient = @third_gradient.to_f
    end
    aging_param = @alpha.to_f + temp_gradient*(time.to_f/@simulation_number.to_f)**2
    self.q01 = self.q01.to_f + aging_param.to_f
    #p self.q01
    # save parameter between 0 and 1
    self.guard_parameter
    self.q10 = self.q10.to_f - aging_param.to_f
    self.q10
    # save parameter between 0 and 1
    self.guard_parameter

    #p "last resultq01:#{self.q01},#{self.q01}"
    #self.current_state = self.move_state()
    temp_gradient
  end
end
