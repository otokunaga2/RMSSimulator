require 'fileutils'
require 'date'
module OutputWriter
def create_file
end

end

now = Date.today.strftime("%Y-%m-%d%s")
FileUtils.touch("#{now}.txt")


