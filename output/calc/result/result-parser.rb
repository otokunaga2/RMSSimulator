require 'fileutils'
require 'csv'
require 'find'

#
class ResultParser
  attr_reader :matched_list, :stored_hash, :number_true_positive, :number_false_positive, :number_false_negative, :number_true_negative
  # define as constant number
  ILL=1
  HEALTHY=0
  RESULT_PREFIX="result"
  OUTPUT_FILEFORMT=".csv"

  #特定の掘りたいインデックス番号をコンストラクタに指定
  #例: index_number=1
  def initialize()
    @matched_list = []
    @number_true_positive = 0
    @number_true_negative = 0
    @number_false_positive = 0
    @number_false_negative = 0
  end

  def init_simulation_parameters
    @number_true_positive  = 0
    @number_true_negative  = 0
    @number_false_positive = 0
    @number_false_negative = 0
  end

  def concat_result
    result_string = "#{@number_true_negative}, #{@number_false_negative},#{@number_true_positive},#{@number_false_positive}\n"
    result_string
  end
  def specify_target_file_list(grep_str,target_country_name,specific_dir_index)
    #結果を生成するためのファイルのパス
    @result_file_base = RESULT_PREFIX + target_country_name + specific_dir_index.to_s + "_"
    FileUtils.touch(@result_file_base)

    Find.find("./#{target_country_name}/#{specific_dir_index}") do |dirname|
      file_name = File.basename(dirname, "*")
      begin
        File::ftype(file_name) == "directory"
      rescue => e
        #do nothing
      end
      if file_name =~ grep_str
        #書き込む値の初期化関数の呼び出し
        p "passed"
        init_simulation_parameters()
        read_and_export_result("./#{target_country_name}/#{specific_dir_index}/" << file_name)
      end
    end
  end
  def write_result_file(result_file_name)
    result_string = concat_result()
    File.open(result_file_name, "a") do |f|
      begin
      f.write result_string
      rescue => e
        p "error has occured #{e}"
      end
    end
  end
  def read_and_export_result(file_name)
    line_number = 1
    CSV.foreach(file_name) do |row|
      if row[0].to_i == HEALTHY && row[1].to_i == HEALTHY
        @number_true_negative = @number_true_negative + 1
      elsif row[0].to_i == ILL && row[1].to_i == HEALTHY
        @number_false_positive = @number_false_positive + 1
      elsif row[0].to_i == HEALTHY && row[1].to_i == ILL
        @number_false_negative = @number_false_negative + 1
      elsif row[0].to_i == ILL && row[1].to_i == ILL
        @number_true_positive = @number_true_positive + 1      
      end
      #もし5年が経過したら、ファイルに経過を書き込み
      #集計カウンタをそれぞれリセットする
      if line_number % (365 * 5) == 0
        result_file = @result_file_base + line_number.to_s + "Y" + OUTPUT_FILEFORMT
        write_result_file(result_file)
        init_simulation_parameters
      end

      line_number = line_number + 1
    end
  end
end

result_instance = ResultParser.new()
country_name_list=["india"]
for i in 700..1000 do 
  country_name_list.each do |current_country_name|
    index_number=i
    grep_file_str=/.*#{current_country_name}.*.txt/
    result_instance.specify_target_file_list(grep_file_str,current_country_name,index_number)
  end
end
