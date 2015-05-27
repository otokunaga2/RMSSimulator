require 'fileutils'
require 'date'
module OutputWriter
  def create_file(file_name)
    now = Time.now.strftime("%Y-%m-%d-%S")
    unless file_name != nil
      file_name =  "#{now}.txt"
    end
    @target_name = "output/" << file_name
    #creating file
    FileUtils.touch(@target_name)
  end

  def write_to_file(msg)
    File.open(@target_name, "a") do |f|
      f.write msg
    end
  end
end
