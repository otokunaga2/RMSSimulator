require 'minitest/autorun'
require 'minitest/unit'
require '../watcher.rb'
require '../elderly.rb'

class TestWatcher < MiniTest::Test
  def setup
    @low_watcher = Watcher.new(healthy_failure_ratio: 0 , ill_failure_ratio: 0)
    @imperfect_watcher = Watcher.new(healthy_failure_ratio: 1, ill_failure_ratio: 1)
    @subject_elderly = Elderly.new(alpha: 0.01, y: 0.001, q01: 0.003, q10: 0.003, simulation_number: 100, gradient: 0.003,
                        second_gradient: 0.002, third_gradient: 0.002, first_state: 1)
  end
  # 
  #watcherの高齢者が健康時のヘルスチェックが確率通り機能しているかチェック
  def test_success_watch_health_behavior
    #assert_equal @watcher,true 
    assert_equal @low_watcher.judge_state(0), 0
  end

  def test_failure_watch_health_behavior
    #assert_equal @watcher,true 
    assert_equal @low_watcher.judge_state(1), 1
  end

  def test_watch_health_behavior
    #assert_equal @watcher,true 
    assert_equal @imperfect_watcher.judge_state(1), 0
  end
  def test_watch_ill_behavior
    assert_equal @imperfect_watcher.judge_state(0), 1
  end 
end
