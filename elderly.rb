require './markov.rb'
class Elderly < Markov
  attr_accessor :current_state, :y
  def initialize(alpha: nil, y: nil, q01: nil, q10: nil,simulation_number: nil,gradient: nil,
                 second_gradient: nil,third_gradient: nil,first_state: nil)
    @simulation_number = simulation_number
    @gradient=gradient
    @second_gradient = second_gradient
    @third_gradient = third_gradient
    @aging_param=alpha
    self.y = y
    self.current_state = first_state
    # 
    self.q01 = (Rational(q01) - Rational(y))
    #p "confirm init #{self.q01}"
    self.q10 = (Rational(q10) + Rational(y))
    #p "confirm init #{self.q10}"
    super(first_state)
  end
  #高齢者モデルの健康状態悪化確率の遷移
  def set_gradient(time)
    #one_year = 365
    temp_gradient = @gradient
    #case time.to_i
    #  when 0..one_year*10 then temp_gradient = @gradient
    #  when one_year*10+1..one_year*10*2 then temp_gradient = @second_gradient
    #  when one_year*10*2+1..one_year*10*3 then temp_gradient = @third_gradient
    #end
    temp_gradient
  end
  def aging(time)
    temp_gradient = set_gradient(time)
    @aging_param =   Rational(@aging_param.to_s) * (1 + Rational(temp_gradient.to_s)/ Rational("1000000000"))

    temp_q01 = Rational(self.q01)
    temp_aging_param =  Rational(@aging_param)
    #p temp_aging_param.to_f
    self.q01 = temp_q01.to_r + temp_aging_param.to_r
    #p self.q01.to_f
    # save parameter between 0 and 1
    self.guard_parameter
    # save parameter between 0 and 1
    #
    #
    temp_q10 = Rational(self.q10)
    self.q10 = temp_q10.to_r - temp_aging_param.to_r
    self.guard_parameter
    #self.current_state = self.move_state()
    temp_gradient
  end
end
