require 'fileutils'
require 'csv'
require 'find'
class ResultParser
  attr_reader :matched_list, :stored_hash, :number_true_positive, :number_false_positive, :number_false_negative, :number_true_negative
  # define as constant number
  ILL=1
  HEALTHY=0
  RESULT_PREFIX="result"

  def initialize()
    specific_country_name=ARGV[0]
    @matched_list = []
    @number_true_positive = 0
    @number_true_negative = 0
    @number_false_positive = 0
    @number_false_negative = 0
    @result_file_name = RESULT_PREFIX + specific_country_name

    @grep_file_str=/.*#{specific_country_name}.*.txt/
    FileUtils.touch(@result_file_name)
  end


  def create_result
    result_string = "true_positive:" + @number_true_positive.to_s + "," + "true_negative:" + @number_true_negative.to_s + "," + "false_positive:" + @number_false_positive.to_s + "," + "false_negative:" + @number_false_negative.to_s + "\n"
    result_string
  end

  def specify_target_file_list
    Find.find(".") do |dirname|
      file_name = File.basename(dirname, "*")
      begin
        File::ftype(file_name) == "directory"
      rescue => e
        #raise error?
      end
      if file_name =~ @grep_file_str
        read_and_export_result(file_name)
      end
    end
  end
  #need refactoring  points
  #  1.(row[0],row[1] -> row[:actual],row[:observed])
  #  2. make function 
  #       row[0].to_i == HEALTHY && row[1].to_i == HEALTHY 
  #         e.g. @number_true_positive judge_state(actual_state,observed_state)
  def read_and_export_result(file_name)
    #private method calling
    init_paramters
    CSV.foreach(file_name) do |row|
      if row[0].to_i == HEALTHY && row[1].to_i == HEALTHY
        @number_true_positive = @number_true_positive + 1      
      elsif row[0].to_i == ILL && row[1].to_i == ILL
        @number_true_negative = @number_true_negative + 1
      elsif row[0].to_i == ILL && row[1].to_i == HEALTHY
        @number_false_negative = @number_false_negative + 1
      elsif row[0].to_i == HEALTHY && row[1].to_i == ILL
        @number_false_positive = @number_false_positive + 1
      end
    end
    result_string = create_result
    File.open(@result_file_name, "a") do |f|
      begin
      f.write result_string
      rescue => e
        p "error has occured #{e}"
      end
    end
  end
  private
    def init_paramters
      @number_false_negative = 0
      @number_false_positive = 0
      @number_true_positive = 0
      @number_true_negative = 0
    end
end
result_instance = ResultParser.new
result_instance.specify_target_file_list