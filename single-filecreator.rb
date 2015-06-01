
  def create_file(prefix: nil)
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name = prefix << "#{now}.txt"
    target_name = "output/" << file_name
    if (File.exist?(target_name))
      p target_name
    else
      FileUtils.touch(target_name)
    end
    target_name
  end
  
