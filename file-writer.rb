require 'fileutils'
require 'singleton'
#create output file setting
class OutputWriter
  @targetfile_name
  include Singleton
  def create_file(prefix: nil)
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name = prefix << "#{now}.txt"
    target_name = "output/" << file_name
    if (File.exist?(target_name))
      p target_name
    else
      FileUtils.touch(target_name)
    end
    @target_name = target_name
  end
  
    
  def write_to_file(target_file,msg)
    File.open(@targetfile_name, "a") do |f|
      begin
      f.write msg
      rescue => e
        p "error has occured #{e}"
      end
    end
  end
end
