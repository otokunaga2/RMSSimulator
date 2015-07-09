require 'fileutils'
require 'csv'
require 'find'
#DONE 複数の国を一括で解析できるクラスにする
#
class ResultParser
  attr_reader :matched_list, :stored_hash, :number_true_positive, :number_false_positive, :number_false_negative, :number_true_negative
  # define as constant number
  ILL=1
  HEALTHY=0
  RESULT_PREFIX="result"
  SPECIFIC_COUNTRY_NAME=ARGV[0]
  GREP_FILE_STR=/.*#{SPECIFIC_COUNTRY_NAME}.*.txt/
  OUTPUT_FILEFORMT=".csv"
  def initialize(target_country_name)
    @matched_list = []
    @number_true_positive = 0
    @number_true_negative = 0
    @number_false_positive = 0
    @number_false_negative = 0
    @target_country_name = target_country_name
    @result_file_name = RESULT_PREFIX + target_country_name + OUTPUT_FILEFORMT
    FileUtils.touch(@result_file_name)
  end

  def init_simulation_parameters
    @number_true_positive = 0
    @number_true_negative = 0
    @number_false_positive = 0
    @number_false_negative = 0
  end

  def concat_result
    result_string = "#{@number_true_negative}, #{@number_false_negative},#{@number_true_positive},#{@number_false_positive}\n"
    result_string
  end

  def specify_target_file_list(grep_str,target_country_name)
    Find.find("./#{target_country_name}") do |dirname|
      file_name = File.basename(dirname, "*")
      begin
        File::ftype(file_name) == "directory"
      rescue => e
        #do nothing
      end
      if file_name =~ grep_str
        #書き込む値の初期化関数の呼び出し
        init_simulation_parameters()
        read_and_export_result("./#{target_country_name}/" << file_name)
      end
    end
  end

  def read_and_export_result(file_name)
    CSV.foreach(file_name) do |row|
      if row[0].to_i == HEALTHY && row[1].to_i == HEALTHY
        @number_true_negative = @number_true_negative + 1
      elsif row[0].to_i == ILL && row[1].to_i == ILL
        @number_true_positive = @number_true_positive + 1      
      elsif row[0].to_i == ILL && row[1].to_i == HEALTHY
        @number_false_positive = @number_false_positive + 1
      elsif row[0].to_i == HEALTHY && row[1].to_i == ILL
        @number_false_negative = @number_false_negative + 1
      end
    end
    result_string = concat_result()
    File.open(@result_file_name, "a") do |f|
      begin
      f.write result_string
      rescue => e
        p "error has occured #{e}"
      end
    end
  end
end
country_name_list=["africa","mexico","india","russia","china","ghana"]
temp_country_name=""
grep_file_str=""
setting_file_name_prefix="setting_"
country_name_list.each do |current_country_name|
  grep_file_str=/.*#{current_country_name}.*.txt/
  temp_country_name = current_country_name
  result_instance = ResultParser.new(temp_country_name)
  result_instance.specify_target_file_list(grep_file_str,temp_country_name)
end
