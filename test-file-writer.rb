require './file-writer.rb'
require 'minitest/autorun'
require 'minitest/unit'
class TestFileReader < Minitest::Test
  include OutputWriter
  def setup
    @setting_writer = TestFileReader.new(nil)
  end
  def test_is_file_created?
  end
  def test_is_writing?
    file_name = '2015-05-26-22.txt'
    @setting_writer.create_file(file_name)
    @setting_writer.write_to_file('hogehoge')
    f = open('output/' << file_name)
    test_message = nil
    while line = f.gets
      test_message = line.chomp("\n")  
    end
    p test_message
  end

  def test_is_file_empty?
    file_name = 'output/2015-05-26-22.txt'
    test_message = nil
    f = open(file_name)
    while line = f.gets
      test_message = line.chomp("\n")  
    end
    assert_equal "",test_message
    
  end
end
