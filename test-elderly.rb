require 'minitest/autorun'
require 'minitest/unit'
require './elderly.rb'


class TestFoo < MiniTest::Test
  def setup
    @eldery = Elderly.new(0.2,0.1,0.3,1000,0.00001,0)
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
end
