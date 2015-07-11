require 'fileutils'
require 'csv'
require 'find'

#TODO ファイル名（設定名ごとに分けて修正するように変更)
#
class FileMover

  def initialize
  end
  def setup_dir(dir_path)

  end
  def specify_target_file_list(dir_target, grep_str,target_country_name,specific_dir_index)
    Find.find("./#{target_country_name}/") do |dirname|
      file_name = File.basename(dirname, "*")
      begin
        File::ftype(file_name) == "directory"
      rescue => e
        #do nothing
      end
      if file_name =~ grep_str
         #p "dirtarget: #{dir_target}"
         begin
         FileUtils.mv("./#{target_country_name}/#{file_name}",dir_target)
         rescue => e
         end
      end
    end

  end
end
file_mover = FileMover.new
DIR_HOME_PATH= "/home/tokunaga/RMSSimulator/output/calc"
OUTPUT_PATH= "/home/tokunaga/RMSSimulator/output/calc/result"
#country_list = ["africa","china","ghana","mexico", "india","russia"]
country_list = ["india"]

country_list.each do |country_name|
  for i in 700..1000 do
    temp_path= DIR_HOME_PATH + "/" + country_name + "/" 
    #p temp_path
    dir_full_path = temp_path + i.to_s + "/"
    #p "full path :#{dir_full_path}"
    begin
      Dir.mkdir(dir_full_path)
    rescue => e
      p "もうあるよ"
    end
  end
end

country_list.each do |country_name|
  for i in 700..1000 do
    temp_target_dir_path = ""
    dir_number=i
    temp_target_dir_path =  OUTPUT_PATH + "/" + country_name + "/" + dir_number.to_s
    file_mover.specify_target_file_list(temp_target_dir_path,/#{dir_number}/,country_name.to_s,i)

  end
end
