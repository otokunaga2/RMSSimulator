require './markov.rb'
class Elderly
  include Markov
  def initialize(alpha,beta)
    @state=[0,1]
    @current_state=0
  end
  def work
    p "is it work?"
  end
  def hogehoge

  end

  

end

instance_elderly=Elderly.new(0.2,1)

instance_elderly.move_another_state(0,0.5)
