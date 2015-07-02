require 'minitest/autorun'
require 'minitest/unit'
require 'test-run.rb/watcher.rb'

class TestWatcher < MiniTest::Test
  def setup
    @watcher = Watcher.new({:healthy => 0.6,:ill => 0.3})
  end

  #expect fail
  def test_random_val
    assert_nil @watcher.generate_random
  end

  def test_bar
    assert_equal 0,0
  end

end
