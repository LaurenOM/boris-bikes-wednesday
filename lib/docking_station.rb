class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bike
    raise "docking station is empty" if @bikes == []
    @bikes.pop
  end
  
  def dock(bike)
    
    raise "docking station is full" if @bikes.length >= 20
    @bikes << bike
  end

end
