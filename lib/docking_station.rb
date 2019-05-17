class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'docking station is empty' if empty?
    raise "no working bikes" if bikes.last.broken

    bikes.pop
  end
  
  def dock(bike, broken=false)
    raise "docking station is full" if full?
    
    bike.broken = broken

    if bike.broken
      bikes.unshift(bike)
    else
      bikes << bike
    end
  end

  def release_broken
    broken_bikes = []

    @bikes.each do |bike|
        broken_bikes.push(bike) if bike.broken
    end
    @bikes -= broken_bikes
    return broken_bikes
  end

  private 

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
