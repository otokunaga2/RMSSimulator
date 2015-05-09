require './output-writer.rb'
class Sample
  include OutputWriter

end

tmp_instance = Sample.new
tmp_instance.create_file
tmp_instance.write_to_file
