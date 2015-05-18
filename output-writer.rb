require 'fileutils'
require 'date'
module OutputWriter
  attr_accessor :cursor_file
  @cursor_file = nil
  @target_name =nil
  def set_file_name(target_name)
    @target_name = target_name
  end
  def create_file
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name =  "#{now}.txt"
    FileUtils.touch(@target_name << "/" << file_name)
    p "exe"
    @cursor_file=@target_name 
  end
  def write_to_file(msg)
    File.open(@cursor_file, "w") do |f|
      f.write msg
    end
  end
end
