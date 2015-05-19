require 'minitest/autorun'
require 'minitest/unit'
require './watcher.rb'

class TestWatcher < MiniTest::Test
  def setup
    @watcher = Watcher.new({:healthy => 0.6,:ill => 0.3})
  end
  def test_judge
    assert_equal @watcher.judge_state(0),0
  end

  # teardown はあまり使わない
  def teardown
  end
end
