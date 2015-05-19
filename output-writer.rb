require 'fileutils'
require 'date'
module OutputWriter
  @target_name = nil
  def create_file(target_name)
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name =  "#{now}.txt"
    unless @target_name != nil then
      @target_name = target_name << "/" << file_name
    end
    #creating file
    FileUtils.touch(@target_name)
  end
  def write_to_file(msg)
    File.open(@target_name, "a") do |f|
      f.write msg
    end
  end
end
