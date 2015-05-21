class ResultParser
  attr_reader :matched_list, :stored_hash
  
  def initialize()
    @matched_list = []
  end
  def read_file(file_name)
    File.open(file_name) do |file|
      file.each do |line|
        #
        unless line == nil || line == "\n" then
          if line.match(/(?<elderly\_state>)/) != nil
            #<?XXXX> this shows the named as grepped  parameter
            state = line.match(/(?<prev>\w{13}+:)(?<realnum>\d{1})+,(?<watch>\w{13}+:)(?<watched_number>\d{1})/)
            p state["realnum"]
            p state["watched_number"]
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
