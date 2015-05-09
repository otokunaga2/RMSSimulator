require './elderly.rb'
class Main
  def initialize
    elderly_instance = Elderly.new(0,1)
    elderly_instance.work
    @time = 0
    #seed as time
    @random_instance = Random.new(Time.now.to_i)
  end

  def simulate
    @time=@time+1
    p "time is : #{@time}"
  end 

  def get_rand
    p @random_instance.rand()
  end
  


end

main_instance_val = Main.new
main_instance_val.get_rand
