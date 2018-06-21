require_relative 'coordinate.rb'

class User 
	attr_accessor :location
	def initialize(coordinate)
		@location = coordinate
	end
end

