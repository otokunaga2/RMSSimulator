require 'find'
require './result-parser.rb'

resutparser_instance = ResultParser.new


Find.find(".") do |dirname|
  file_name = File.basename(dirname, "*")
  if File::ftype(file_name) == "directory"
    #do nothing
  else
    #specify with file name
    if file_name =~ GREP_FILE_EXP
    end
  end
end

