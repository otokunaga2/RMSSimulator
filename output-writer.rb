require 'fileutils'
require 'date'
module OutputWriter
@cursor_file = nil
  def create_file
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name =  "#{now}.txt"
    FileUtils.touch(file_name)
    p "exe"
    @cursor_file=file_name
  end
  def write_to_file(msg)
    File.open(@cursor_file, "w") do |f|
      f.write msg
    end
  end
end
