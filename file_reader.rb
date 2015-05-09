f = open("setting.txt")
#/(?<keytag>\w):(?<number>\d{3})/
keywords = %w[alpha beta gamma loop]
matched_list = []
while line = f.gets 
  line = line.chomp("\n")
  keywords.each do |keyword|
    if line.match(/(?<keytag>#{keyword}):(?<number>\d+(\.\d+)?)/) != nil
    matched_list.push(line.match(/(?<keytag>#{keyword}):(?<number>\d+(\.\d+)?)/))
    end
  end
end
f.close

matched_list.each do |match_component|
  p  match_component["number"]
end
