require 'csv'
class ResultParser
  attr_reader :matched_list, :stored_hash, :number_true_positive
  
  def initialize()
    @matched_list = []
    @number_true_positive = 0
  end
  def grep_output_file
    #ある特定ディレクトリ以下のファイルオブジェクトをごっそりとってきて、インスタンスにいれる
  end
  def read_file(file_name)
    CSV.foreach(file_name) do |row|
      p row[0], row[1]
      if row[0] == row[1]
        @number_true_positive = @number_true_positive + 1      
      elsif row[0] == 0 && row[1] == 1
        
      end
    end
    #File.open(file_name) do |file|
    #  file.each do |line|
    #    #
    #    unless line == nil || line == "\n" then
    #      if line.match(/(?<elderly\_state>)/) != nil
    #        #<?XXXX> this shows the named as grepped  parameter
    #        state = line.match(/(?<prev>\w{13}+:)(?<realnum>\d{1})+,(?<watch>\w{13}+:)(?<watched_number>\d{1})/)
    #        p state["realnum"]
    #        p state["watched_number"]
    #      end
    #    end
    #     # p line.match(/(?<elderly state>):(?<number>\d?)/)[2] 
    #     # p line.match(/(?<judged\_state>):(?<watched_number>\d)/)[2]
    #  end
    #end
  end
end