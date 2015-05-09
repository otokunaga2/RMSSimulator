require './markov.rb'
class Elderly < Markov
  def initialize(alpha,beta)
    @state=[0,1]
    #@current_state=0
    super(0.1,0.3,0)
  end
  def work
    p "is it work?"
  end
  def hogehoge

  end
  def aging
     
  end
  

end

instance_elderly=Elderly.new(0.2,1)

p instance_elderly.move_another_state()
p instance_elderly.current_state
