class DockingStation
  attr_reader :bike
  
  def release_bike
    if @bike == nil
      raise "docking station is empty"
    else
      Bike.new
    end
  end
  
  def dock(bike)
    if bike == nil
      @bike = bike
    else 
      raise "docking station is full"
    end
  end

end
