require 'docking_station.rb'

describe DockingStation do
#  it "responds to release bike method" do
# 	docking_station = DockingStation.new
# 	docking_station.release_bike

# 	expect(docking_station).to respond_to(:release_bike)

#  end

	it "gets a bike and expects it to be working" do
		bike = Bike.new

		expect(bike.working?).to eq(true)
	end

  # it "can dock a bike" do
	# 	station = DockingStation.new

  #   expect(station.dock(nil)).to eq(bike)
	# end


	# it "can show a docked bike" do
	# 	docking_station = DockingStation.new
	# 	bike = Bike.new

	# 	docking_station.dock(bike)
		
	# 	expect(docking_station.bike).to eq(bike)
  # end
  
  it 'can throw error if no bike is docked' do
    station = DockingStation.new
    
    expect{station.release_bike}.to raise_error("docking station is empty")
  end

	it 'throws an error if bike is already docked' do
		station = DockingStation.new
		bike = Bike.new
		20.times{station.dock(bike)}
		expect{station.dock(bike)}.to raise_error("docking station is full")
	end
end
