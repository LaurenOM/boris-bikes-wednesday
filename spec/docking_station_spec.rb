require 'docking_station.rb'

describe DockingStation do

	let(:bike) {Bike.new}

	it "gets a bike and expects it to be working" do
		expect(bike.working?).to eq(true)
	end

  it "can dock a bike" do
		station = DockingStation.new

    expect(station.dock(bike)).to include(bike)
	end


	it "can show a docked bike" do
		docking_station = DockingStation.new

		docking_station.dock(bike)
		
		expect(docking_station.bikes).to include(bike)
  end
  
  it 'can throw error if no bike is docked' do
    station = DockingStation.new
    
    expect{station.release_bike}.to raise_error("docking station is empty")
  end

	it 'throws an error if bike is already docked' do
		station = DockingStation.new

		DockingStation::DEFAULT_CAPACITY.times{station.dock(bike)}
		expect{station.dock(bike)}.to raise_error("docking station is full")
	end

	it 'can set a default capacity or specified capacity' do
		station_25 = DockingStation.new(25)

		25.times{ station_25.dock(bike) }
		expect{station_25.dock(bike)}.to raise_error("docking station is full")
	end 
end
