require '/home/tokunaga/work/RMSSimulator/file-reader.rb'
require 'minitest/autorun'
require 'minitest/unit'
class TestFileReader < Minitest::Test
  def setup
    @setting_reader = SettingReader.new("setting.txt")
  end
  def confirm_matched_list_is_not_empty
    assert_equal @setting_reader.matched_list,[]
  end
  def test_file_write
    assert_equal @setting_reader.stored_hash,{}
  end
end
