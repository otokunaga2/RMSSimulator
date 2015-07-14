require 'fileutils'
BASE_DIR="/home/tokunaga/RMSSimulator"
TEMP_DIR="./test/"
country_list = ["mexico", "africa", "china", "ghana", "india", "russia"]

country_list.each do |country_name|
   for i in 700..999
    target_dir = TEMP_DIR + country_name + "/" + i.to_s
    grep_file_name= "./test/*" + country_name + "*#{i}"
    FileUtils.mv(grep_file_name, target_dir)
    i = i + 1
  end
end
