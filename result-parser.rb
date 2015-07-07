require 'fileutils'
require 'csv'
require 'find'
class ResultParser
  attr_reader :matched_list, :stored_hash, :number_true_positive,
              :number_false_positive, :number_false_negative, :number_true_negative, :country_list
  ILL=1
  HEALTHY=0
  RESULT_PREFIX="result"
  SPECIFIC_COUNTRY_NAME=ARGV[0]
  CSV_FILE_FORMAT=".csv"
  def initialize()
    @matched_list = []
    @number_true_positive = 0
    @number_true_negative = 0
    @number_false_positive = 0
    @number_false_negative = 0
    @country_list = ["africa","india","china","russia","mexico","ghana"]
    @country_list.each do |country_name|
      @result_file_name = RESULT_PREFIX + country_name + CSV_FILE_FORMAT
      FileUtils.touch(@result_file_name)
    end
  end

  def concat_result
    result_string = "#{@number_true_negative}, #{@number_false_negative},#{@number_true_positive},#{@number_false_positive}\n"
    result_string
  end

  def specify_target_file_list(grep_str)
    Find.find(".") do |dirname|
      file_name = File.basename(dirname, "*")
      if File::ftype(file_name) == "directory"
        next
      end
      if file_name =~ grep_str
        #書き込む値の初期化関数の呼び出し
        init_simulation_parameters()
        read_and_export_result(file_name)
      end
    end
  end
  def init_simulation_parameters
    @number_true_positive = 0
    @number_true_negative = 0
    @number_false_positive = 0
    @number_false_negative = 0
  end
  def read_and_export_result(file_name)
    CSV.foreach(file_name) do |row|
      #row[0]:観察した値, row[1]:実直
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
result_instance = ResultParser.new
result_instance.country_list.each do |coutnry_name|
  p coutnry_name
end
result_instance.specify_target_file_list
#
GREP_FILE_STR=/.*#{SPECIFIC_COUNTRY_NAME}.*.txt/
