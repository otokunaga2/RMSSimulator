class ResultParser
  attr_reader :matched_list, :stored_hash
  def initialize()
    @matched_list = []
  end
  def read_file(file_name)
    File.open(file_name) do |file|
      file.each do |line|
        if line.match(/(?<elderly state>):(?<number>\d?)/) 
          current_state = line.match(/(?<elderly state>):(?<number>\d?)/)[2].to_i
          watched_state = line.match(/(?<judged\_state>):(?<watched_number>\d)/)[2].to_i
          if current_state == watched_state
            p "tp"
          else 
            p "tn"
          end
         # p line.match(/(?<elderly state>):(?<number>\d?)/)[2] 
         # p line.match(/(?<judged\_state>):(?<watched_number>\d)/)[2]
        end
      end
    end
  end
end
tmp = ResultParser.new()
tmp.read_file("./test/test.txt")
