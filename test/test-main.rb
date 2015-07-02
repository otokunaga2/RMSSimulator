require 'minitest/autorun'
require 'minitest/unit'
require '/home/tokunaga/work/RMSSimulator/main.rb'


class TestFoo < MiniTest::Test
  def setup
    @main = Main.new
  end
  # teardown はあまり使わない
  def teardown
  end
  #
  def test_move_state_from0_to0
    p @main.elderly.move_state
    p "current state#{@main.elderly.current_state}"
  end

  def test_move_state_from0_to1
  end
  def test_move_state_from1_to0
  end
  def test_move_state_from1_to1
  end
end
