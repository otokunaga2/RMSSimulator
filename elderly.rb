require './markov.rb'
class Elderly < Markov
  def initialize(alpha: nil, beta: nil,gamma: nil,simulation_number: nil,gradient: nil,
                 second_gradient: nil,third_gradient: nil,first_state: nil)
    @simulation_number = simulation_number
    @gradient=gradient.to_f
    @second_gradient = second_gradient.to_f
    @third_gradient = third_gradient.to_f
    @aging_param=alpha
    @alpha = alpha
    self.q01 = beta
    self.q10 = gamma
    super(first_state)
  end
  def reset_parameter(alpha: nil, beta: nil,gamma: nil,simulation_number: nil,gradient: nil,
            second_gradient: nil,third_gradient: nil,first_state: nil)
    @simulation_number = simulation_number
    @gradient=gradient.to_f
    @second_gradient = second_gradient.to_f
    @third_gradient = third_gradient.to_f
    @aging_param=alpha
    @alpha = alpha
    self.q01 = beta
    self.q10 = gamma
    self.first_state = 0
  end
  def aging(time)
    one_year = 365
    temp_gradient = 0
    case time.to_i
      when 0..one_year*10 then temp_gradient = @gradient.to_f
      when one_year*10+1..one_year*10*2 then temp_gradient = @second_gradient.to_f
      when one_year*10*2+1..one_year*10*3 then temp_gradient = @third_gradient.to_f
    end
    @aging_param =  @aging_param.to_f*( 1 + temp_gradient.to_f)

    self.q01 = self.q01.to_f + @aging_param.to_f
    # save parameter between 0 and 1
    self.guard_parameter
    self.q10 = self.q10.to_f - @aging_param.to_f

    # save parameter between 0 and 1
    self.guard_parameter
    #p "last resultq01:#{self.q01},#{self.q01}"
    #self.current_state = self.move_state()
    temp_gradient
  end
end
