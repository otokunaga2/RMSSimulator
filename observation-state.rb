class ObservationState
  attr_reader :state_number, :state_name
  attr_accessor :target_watcher, :target_elderly
  def initialize(state_number=0,state_name="tn")
    
  end
  def show_target_watcher
    p target_elderly.current_state
  end
end
