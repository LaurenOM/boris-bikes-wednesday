require './lib/garage'
require './lib/bike'
require './lib/docking_station'
require './lib/van'

van = Van.new
bike = Bike.new
garage = Garage.new 
station = DockingStation.new

3.times { station.dock(Bike.new, true) }
van.van_pickup(station)
garage.receive_bikes(van)
garage.fix_bikes
