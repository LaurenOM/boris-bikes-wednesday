class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "docking station is empty" if empty?
    @bikes.each do |bike|
      if bike.broken == false
        @bikes.pop
      end
    end
    raise "no working bikes"
  end
  
  def dock(bike, broken=false)
    raise "docking station is full" if full?
    
    bike.broken = broken
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
