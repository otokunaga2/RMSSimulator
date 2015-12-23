require 'minitest/autorun'
require 'minitest/unit'
require '../markov.rb'


class MarkovTest < MiniTest::Test
  def setup
    @markov = Markov.new(0,0.1,0.24,0)

    @markov.q01 = 0.5
    @markov.q10 = 1 
  end
  # teardown はあまり使わない
  def teardown
    @markov = nil
  end
  #
  def test_move_state_from0_to0
    @markov.current_state = 0
    @markov.move_state(0.2)
    assert_equal 1, @markov.current_state
  end

  def test_move_state_from0_to1
    #p @markov.q01
    #p @markov.q10
    @markov.current_state = 0
    @markov.current_state = @markov.move_state(0.6)
    assert_equal 0, @markov.current_state
  end
  def test_move_state_from1_to0
    @markov.current_state = 1
    @markov.q10 = 0.5
    @markov.current_state = @markov.move_state(0)
    assert_equal 0, @markov.current_state
  end
  def test_move_state_from1_to1
    @markov.current_state = 1
    @markov.q10 = 0
    @markov.current_state = @markov.move_state(1)
    assert_equal 1, @markov.current_state
  end
end
