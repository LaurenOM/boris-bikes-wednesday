require 'garage'

describe Garage do 
	let(:garage) {Garage.new}
	let(:station) {DockingStation.new}
	let(:van) {Van.new}
	bike = Bike.new

	it 'will receive broken from van' do

		station.dock(Bike.new)
		3.times { station.dock(Bike.new, true) }

		van.van_pickup(station)

		expect(garage.receive_bikes(van).length).to eq(3)
	end 

	# it 'will fix broken bikes' do 
	# 	station.dock(Bike.new)
	# 	3.times { station.dock(Bike.new, true) }

	# 	van.van_pickup(station)
	# 	garage.receive_bikes

	# 	expect(garage.fix_bikes).to include(@broken=false)
	# end 
end