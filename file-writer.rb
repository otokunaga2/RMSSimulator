require 'fileutils'
require 'singleton'
#only one instance
class OutputWriter
  include Singleton
  def write_to_file(target_file,msg)
    File.open(target_file, "a") do |f|
      begin
      f.write msg
      rescue => e
        p "error has occured #{e}"
      end
    end
  end
  def create_file(prefix: nil)
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name = prefix << "#{now}.txt"
    set_to_dir_file = "output/" << file_name
    begin
      FileUtils.touch(set_to_dir_file)
    rescue e
      p "#{e},ファイルを作成することに失敗しました"
      raise Error
    end
  end
end


p  OutputWriter.instance.create_file(:prefix=>"china" )
