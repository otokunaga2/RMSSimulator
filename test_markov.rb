require 'minitest/unit'
require './markov.rb'

MiniTest::Unit.autorun

class TestFoo < MiniTest::Unit::TestCase
  def setup
    @markov = Markov.new(0,0.1,0.24,0)
  end
  # teardown はあまり使わない
  def teardown
    @markov = nil
  end
  #
  def test_markov
  end
  #
  def test_move_to_1_state
    @markov.q01 = 1
    @markov.q10 = 0
    assert_equal 1, @markov.move_state
  end
end
