require 'van'

describe Van do 
  let(:van) {Van.new}
	let(:station) {DockingStation.new}

	it 'can collect broken bikes from Docking station' do

		station.dock(Bike.new)
		3.times { station.dock(Bike.new, true) }

		van_bikes = van.van_pickup(station)

		expect(van_bikes.length).to eq(3)
	end

	it 'can drop off broken bikes at garage' do 

		3.times {station.dock(Bike.new, true)}

		van.van_pickup(station)

		expect(van.drop_broken.length).to eq(3)
	end
    
end