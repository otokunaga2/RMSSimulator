require 'singleton'
class RationalCalculator
  include Singleton
  PADDING_NUMBER="1000000000"
  def convert_to_rational_number(a)
    Rational(a)
  end
  def  minus_as_rational(a,b)
    temp_number = Rational(a) - Rational(b)
    return temp_number
  end
  def plus_as_rational(a,b)
    temp_number = Rational(a) + Rational(b)
    return temp_number
  end

  def  calc_aging_param(aging_param,temp_gradient)
    aging_param =  Rational(aging_param) * (1 + Rational(temp_gradient)/ Rational(PADDING_NUMBER))
  end
end

