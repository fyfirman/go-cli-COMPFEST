require_relative 'coordinate.rb'

class User 
	attr_reader :location
	attr_reader :destination
	def initialize(coordinate)
		@location = coordinate
	end

	def destination(coordinate)
		@destination = coordinate
	end
end

# puts User.new(Coordinate.new(4)).destination(Coordinate.new(4)).x
