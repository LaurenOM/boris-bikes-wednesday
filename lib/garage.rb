class Garage
	attr_accessor :bikes 
	def initialize
		@garage_bikes = []
	end

	def receive_bikes(van)
		van.drop_broken.each do |bike|
			@garage_bikes.push(bike)
		end
	end
	
end