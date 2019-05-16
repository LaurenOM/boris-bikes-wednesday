class Van 
	attr_accessor :van_bikes
	def initialize 
		@van_bikes = []
	end 

	def van_pickup(station)
		station.release_broken.each do |bike|
			@van_bikes.push(bike)
		end
	end

	def drop_broken
		for_garage = []
		@van_bikes.each do |bike|
			for_garage.push(bike)
		end
		@van_bikes -= for_garage
		for_garage
	end
end