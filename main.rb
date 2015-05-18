require './elderly.rb'
require './file_reader.rb'
require './output-writer.rb'
class Main
  attr_accessor :time, :elderly
  #create_file,output_file is defined
  include OutputWriter
  def initialize
    @file_read_instance = SettingReader.new
    @file_read_instance.store_to_hash
    alpha = @file_read_instance.stored_hash["alpha"]
    beta = @file_read_instance.stored_hash["beta"]
    gamma = @file_read_instance.stored_hash["gamma"]
    simulation_number = @file_read_instance.stored_hash["simulation_number"]
    gradient = @file_read_instance.stored_hash["gradient"]
    firststate = @file_read_instance.stored_hash["firststate"]
    firststate = 0
    @elderly = Elderly.new(alpha,beta,gamma,simulation_number,gradient,firststate)
    @time = 0
    #seed set as time
    @random_instance = Random.new(1)
  end

  def simulate
    #get agingn
    self.create_file('output')
    @time=@time+1
    @elderly.aging(@time)
    @elderly.move_state(0)
    if @elderly.current_state == nil
    else
      self.write_to_file("eldery state:"<<@elderly.current_state)
    end
  end 
end

main_instance_val = Main.new

99.times do
  main_instance_val.simulate
end
