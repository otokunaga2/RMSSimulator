require './elderly.rb'
class Main
  attr_accessor :time
  def initialize
    @elderly_instance = Elderly.new(0,1,2,100,0.005)
    @time = 0
    #seed as time
    @random_instance = Random.new(1)
  end

  def simulate
    #get agingn
    @time=@time+1
    @elderly_instance.aging(@time)
  end 


  def get_rand
    p @random_instance.rand()
  end
  


end

main_instance_val = Main.new
for i in 0..100 do 
main_instance_val.simulate

end
