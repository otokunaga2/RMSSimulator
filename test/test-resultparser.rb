require 'minitest/autorun'
require 'minitest/unit'
require './result-parser.rb'

class TestWatcher < MiniTest::Test
  def setup
    @result_instance = ResultParser.new 
  end

  def test_combination_resut
    @result_instance.read_and_export_result("test-1.txt")
    assert_equal 1,@result_instance.number_true_positive
  end

  def test_judge_true_positive
    @result_instance.read_and_export_result("test-2.txt")
    assert_equal 1,@result_instance.number_true_negative
  end

  def test_judge_false_positive
    @result_instance.read_and_export_result("test-3.txt")
    assert_equal 1,@result_instance.number_false_negative
  end

  def test_judge_false_negative
    @result_instance.read_and_export_result("test-4.txt")
    assert_equal 1,@result_instance.number_false_positive
  end

  def test_judge_combination2
    @result_instance.read_and_export_result("test-5.txt")
    assert_equal 1,@result_instance.number_true_positive
    assert_equal 0,@result_instance.number_false_positive
  end
end
