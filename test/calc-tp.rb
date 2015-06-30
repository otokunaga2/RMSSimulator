require 'find'
require './result-parser.rb'

resutparser_instance = ResultParser.new

GREP_FILE_EXP=/.*setting.txt/

Find.find(".") do |dirname|
  file_name = File.basename(dirname, "*")
  if File::ftype(file_name) == "directory"
    #do nothing
  else
    #
    if file_name =~ GREP_FILE_EXP
      resutparser_instance.read_file(file_name)
    end
  end
end

