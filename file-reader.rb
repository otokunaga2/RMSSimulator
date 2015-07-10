class SettingReader
  #DIR_PREFIX = './conf/'
  attr_reader :matched_list, :stored_hash
  #与えられたファイルのキーワードをリストへ格納
  def initialize(file_name,keywords)
    @stored_hash=Hash.new
    begin
      f = open(file_name)
    rescue => e
      p "#{e}"
    end
    @keywords = keywords
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
  #ハッシュに格納する
  def store_to_hash
    @keywords.each do |keyword|
      @matched_list.each do |component|
        case  component["keytag"] 
           when keyword then
              if component["number"] == nil
                raise FileSettingError
              end
              @stored_hash[keyword] = component["number"]
           else
        end
      end
    end
  end
end
