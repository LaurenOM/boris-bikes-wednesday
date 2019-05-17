class Garage
	attr_accessor :garage_bikes 
	def initialize
		@garage_bikes = []
	end

	def receive_bikes(van)
		van.drop_broken.each do |bike|
			@garage_bikes.push(bike)
		end
	end
	
	def fix_bikes
		@garage_bikes.map { |bike| bike.broken = false }
	end
	
	def release_working
		working_bikes = []

    @garage_bikes.each do |bike|
       working_bikes.push(bike) if bike.broken == false
    end
    @garage_bikes -= working_bikes
    working_bikes
	end 
end