require 'fileutils'
require 'csv'
require 'find'

#TODO ファイル名（設定名ごとに分けて修正するように変更)
#
class FileMover

  def initialize
  end


  def specify_target_file_list(grep_str,target_country_name,specific_dir_index)
    Find.find("./#{target_country_name}/#{specific_dir_index}") do |dirname|
      file_name = File.basename(dirname, "*")
      begin
        File::ftype(file_name) == "directory"
      rescue => e
        #do nothing
      end
      if file_name =~ grep_str
         FileUtils.mv("./#{target_country_name}/#{specific_dir_index}/#{file_name}","/home/tokunaga/RMSSimulator/test/sample/")
      end
    end

  end
end
file_mover = FileMover.new
file_mover.specify_target_file_list(/.*99/,"india",1)
