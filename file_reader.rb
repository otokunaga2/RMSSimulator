class SettingReader
  attr_reader :matched_list, :stored_hash
  def initialize
    @stored_hash=Hash.new
    f = open("setting.txt")
    @keywords = %w[alpha beta gamma simulation_number gradient firststate]
    @matched_list = []
    while line = f.gets 
      line = line.chomp("\n")
      @keywords.each do |keyword|
        if line.match(/(?<keytag>#{keyword}):(?<number>\d+(\.\d+)?)/) != nil
        @matched_list.push(line.match(/(?<keytag>#{keyword}):(?<number>\d+(\.\d+)?)/))
        end
      end
    end
    f.close
  end
  def store_to_hash
    @keywords.each do |keyword|
      @matched_list.each do |component|
        case  component["keytag"] 
           when keyword then
              p component["number"]
              @stored_hash[keyword] = component["number"]
           else
             raise Exception
        end
      end

    end

  end
end
