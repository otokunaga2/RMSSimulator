require '/home/tokunaga/RMSSimulator/markov.rb'
require '/home/tokunaga/RMSSimulator/singleton-calculator.rb'

class Elderly < Markov
  attr_accessor :current_state, :y
  def initialize(alpha: nil, y: nil, q01: nil, q10: nil,simulation_number: nil,gradient: nil, first_state: nil)
    @simulation_number = simulation_number
    @gradient=gradient
    @aging_param=alpha
    self.y = y
    self.current_state = first_state
    self.q01 = RationalCalculator.instance.minus_as_rational(q01,y)
    self.q10 = RationalCalculator.instance.plus_as_rational(q10,y)
    super(first_state)
  end
  #高齢者モデルの健康状態悪化確率の遷移(未実装)
  def set_gradient(time)
  end
  def aging(time)
    temp_gradient = @gradient
    aging_param = RationalCalculator.instance.calc_aging_param(@aging_param,temp_gradient)

    temp_q01 = RationalCalculator.instance.convert_to_rational_number(self.q01)

    self.q01 = temp_q01.to_r + aging_param.to_r
    self.guard_parameter
    temp_q10 = RationalCalculator.instance.convert_to_rational_number(self.q10)
    self.q10 = temp_q10.to_r - aging_param.to_r
    self.guard_parameter
    temp_gradient
  end
end
