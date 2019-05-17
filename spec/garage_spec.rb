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

	it 'will fix broken bikes' do 
		station.dock(Bike.new)
		3.times { station.dock(Bike.new, true) }

		van.van_pickup(station)
		garage.receive_bikes(van)

		expect(garage.fix_bikes).not_to include(@broken=true)
	end 

	it 'should give fixed bikes to Van when it asks for them' do
		3.times { station.dock(Bike.new, true) }
		van.van_pickup(station)
		garage.receive_bikes(van)
		garage.fix_bikes

		expect(garage.release_working.length).to eq(3)
	end
end