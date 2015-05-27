require 'minitest/autorun'
require 'minitest/unit'
require './elderly.rb'


class TestFoo < MiniTest::Test
  def setup
    @graidinet_init_param = 0.00001
    @second_gradient_param = 0.3
    @third_gradient_param = 0.5
    @eldery = Elderly.new(alpha: 0.2,beta: 0.1,gamma: 0.3,simulation_number: 1000, 
                          gradient: @graidinet_init_param ,second_gradient: @second_gradient_param, third_gradient: @third_gradient_param, first_state: 0)
  end
  # teardown はあまり使わない
  def teardown
  end
  #
  def test_move_state_from0_to0
    @eldery.q01= 0
    @eldery.current_state = @eldery.move_state(1)
    assert_equal 0, @eldery.current_state
  end

  def test_move_state_from0_to1
    @eldery.q01= 1
    @eldery.current_state = @eldery.move_state(0)
    assert_equal 1, @eldery.current_state
  end
  def test_move_state_from1_to0
  end
  def test_move_state_from1_to1
  end
  def test_changing_time_with_aging
    assert_equal @graidinet_init_param, @eldery.aging(12)
    assert_equal @second_gradient_param, @eldery.aging(3651)
    assert_equal @second_gradient_param, @eldery.aging(7300)
    assert_equal @third_gradient_param, @eldery.aging(7301)
  end
end
