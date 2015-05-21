class ResultParser
  attr_reader :matched_list, :stored_hash
  
  def initialize()
    @matched_list = []
  end
  def read_file(file_name)
    File.open(file_name) do |file|
      file.each do |line|
        unless line == nil then
          if line.match(/(?<elderly\_state>)/) != nil
            p current_state = line.match(/(?<elderly\_state>):(?<number>\d?)/)
            p current_state["number"]
            watched_state = line.match(/(?<watched\_state>):(?<number>\d?)/)
            p watched_state
            p watched_state["number"]
          end
        end
         # p line.match(/(?<elderly state>):(?<number>\d?)/)[2] 
         # p line.match(/(?<judged\_state>):(?<watched_number>\d)/)[2]
      end
    end
  end
end
tmp = ResultParser.new()
tmp.read_file("./test/test.txt")
