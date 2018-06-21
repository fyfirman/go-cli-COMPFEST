require_relative 'coordinate.rb'

class Driver
	attr_reader :location
	attr_reader :name
	# @@total_driver = 0
	def initialize(*name, coordinate)
		# @@total_driver += 1
		@location = coordinate
	
		if !name.empty?
			@name = name
		else
			@name = random_name()
		end
	end

	#Generate random name
	def random_name
		@random_name = ["Asep", "Dadang", "Jajang", "Dede", "Joko", "Deni"]
		@random_name.shuffle!.pop
	end
end

# driver = Driver.new(Coordinate.new(5))
# puts driver.location.x.to_s + "," + driver.location.y.to_s