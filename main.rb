require './elderly.rb'
require './file_reader.rb'
require './output-writer.rb'
class Main
  attr_accessor :time
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
    @elderly_instance = Elderly.new(alpha,beta,gamma,simulation_number,gradient,firststate)
    @time = 0
    #seed set as time
    @random_instance = Random.new(1)
  end

  def simulate
    #get agingn
    self.create_file('output')
    @time=@time+1
    @elderly_instance.aging(@time)
    @elderly_instance.current_state = @elderly_instance.move_state
    p @elderly_instance.current_state
    self.write_to_file("eldery state:"<<@elderly_instance.current_state)
  end 
end

main_instance_val = Main.new

99.times do
  main_instance_val.simulate
end
