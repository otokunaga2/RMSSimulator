require 'fileutils'
module OutputWriter
  def write_to_file(target_file,msg)
    File.open(target_file, "a") do |f|
      begin
      f.write msg
      rescue => e
        p "error has occured #{e}"
      end
    end
  end
end
