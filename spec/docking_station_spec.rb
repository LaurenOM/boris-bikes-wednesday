require 'docking_station.rb'

describe DockingStation do

	let(:bike) {double(:bike)}
	let(:station) {DockingStation.new}
	

	it "can dock a bike" do
		allow(bike).to receive(:broken=)
		allow(bike).to receive(:broken)

		allow(bike).to receive(:broken).and_return(false)

    expect(station.dock(bike)).to include(bike)
	end


	it "can show a docked bike" do
		allow(bike).to receive(:broken=)
		allow(bike).to receive(:broken)

		station.dock(bike)
		
		expect(station.bikes).to include(bike)
  end
  
  it 'can throw error if no bike is docked' do
    expect{station.release_bike}.to raise_error("docking station is empty")
  end

	it 'throws an error if bike is already docked' do
		allow(bike).to receive(:broken=)
		allow(bike).to receive(:broken)
		DockingStation::DEFAULT_CAPACITY.times{station.dock(bike)}
		expect{station.dock(bike)}.to raise_error("docking station is full")
	end

	it 'can set a default capacity or specified capacity' do
		allow(bike).to receive(:broken=)
		allow(bike).to receive(:broken)

		station_25 = DockingStation.new(25)

		25.times{ station_25.dock(bike) }
		expect{station_25.dock(bike)}.to raise_error("docking station is full")
	end 

	it 'can accept a broken bike' do
		allow(bike).to receive(:broken=)
		allow(bike).to receive(:broken).and_return(true)

		station.dock(bike,true)
		
		expect(station.bikes).to include(bike)

	end

	it 'does not release broken bikes' do
		allow(bike).to receive(:broken=)
		allow(bike).to receive(:broken).and_return(true)

		station.dock(bike, true)

		expect{station.release_bike}.to raise_error("no working bikes")
	end

	it 'should give broken bikes to Van when it asks for them' do
		van = Van.new
		
		3.times { station.dock(Bike.new, true) }

		expect(station.release_broken.length).to eq(3)
	end
end
