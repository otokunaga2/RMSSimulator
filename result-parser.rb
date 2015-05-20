class ResultParser
  attr_reader :matched_list, :stored_hash
  def initialize()
    @matched_list = []
  end
  def read_file(file_name)
    File.open("./output/2015-05-20-16.txt") do |file|
      file.each do |line|
        if line.match(/(?<elderly state>):(?<number>\d?)/) || line.match(/(?<judged\_state>):(?<watched_number>\d)/)
          p line.match(/(?<elderly state>):(?<number>\d?)/) 
          p line.match(/(?<judged\_state>):(?<watched_number>\d)/)
        end
      end
    end
  end
end
tmp = ResultParser.new()
tmp.read_file("./output/2015-05-20-16.txt")
