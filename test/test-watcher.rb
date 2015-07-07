require 'minitest/autorun'
require 'minitest/unit'
require '../watcher.rb'
require '../elderly.rb'

class TestWatcher < MiniTest::Test
  def setup
    init_hash = {:healthy => 0.0,:ill => 0.0}
    @low_watcher = Watcher.new(ratio_healthy_failure: 0 , ratio_ill_failure: 0)
    @subject_elderly = Elderly.new(alpha: 0.01, y: 0.001, q01: 0.003, q10: 0.003, simulation_number: 100, gradient: 0.003,
                        second_gradient: 0.002, third_gradient: 0.002, first_state: 1)
  end
  #watcherの高齢者が健康時のヘルスチェックが確率通り機能しているかチェック
  def test_watch_health_behavior
    #assert_equal @watcher,true 
    assert_equal @low_watcher.judge_state(0), 0
  end
end
