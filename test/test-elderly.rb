require 'minitest/autorun'
require 'minitest/unit'
require '../elderly.rb'

class ElderlyTest < MiniTest::Test
  def setup
    @graidinet_init_param = 0.00001
    @second_gradient_param = 0.3
    @third_gradient_param = 0.5
    @y = 0.002
    @alpha = 0.2
    @elderly = Elderly.new(alpha: @alpha, y: 0.002, q01: 0.1, q10: 0.3,simulation_number: 1000, 
                          gradient: @graidinet_init_param ,second_gradient: @second_gradient_param,
                          third_gradient: @third_gradient_param, first_state: 0)
  end

  #高齢者の状態が健康になっていることを確認
  def test_move_state_from0_to0
    @elderly.q01= 0
    @elderly.current_state = @elderly.move_state(1)
    assert_equal 0, @elderly.current_state
  end

  #高齢者の状態が不健康になっていることを確認
  def test_move_state_from0_to1
    @elderly.q01= 1
    @elderly.current_state = @elderly.move_state(0)
    assert_equal 1, @elderly.current_state
  end

  #時間経過とともに高齢者の状態が変化していることを確認
  def test_changing_time_with_aging
    assert_equal @graidinet_init_param, @elderly.aging(12)
    assert_equal @second_gradient_param, @elderly.aging(3651)
    assert_equal @second_gradient_param, @elderly.aging(7300)
    assert_equal @third_gradient_param, @elderly.aging(7301)
  end

  #設定したパラメータが期待通りになっているかどうかを確認
  def test_set_parameters
    assert_equal @elderly.y, @y
  end
  def test_set_q01
    assert_equal @elderly.q01, 0.1 - @y
  end
  def test_set_q10
    assert_equal  0.3 + @y,@elderly.q10 
  end
end
