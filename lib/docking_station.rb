class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "docking station is empty" if empty?
    @bikes.pop
  end
  
  def dock(bike)
    
    raise "docking station is full" if full?
    @bikes << bike
  end

  private 

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
