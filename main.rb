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
    self.create_file
    @time=@time+1
    @elderly_instance.aging(@time)
    @elderly_instance.move_state
    self.write_to_file("q10")
  end 


end

main_instance_val = Main.new

main_instance_val.set_file_name("output")

p main_instance_val.simulate

