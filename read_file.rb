require_relative 'coordinate.rb'

class Read_file
	attr_accessor :array_translate
	def initialize (filename)
		puts filename
		translate(filename)
	end

	#Convert textfile to array
	def translate(filename)
		@array_translate = []
		File.open(filename).each do |line|
			@array_translate << line.split
		end
	end

	#Return mapsize from textfile
	def mapsize
		@array_translate[0][1].to_i
	end

	#Return user location from textfile
	def user_coordinate
		convert_coordinate(1)
	end

	#Return array to coordinate object
	def convert_coordinate(num)
		array = @array_translate[num][1].split(",")
		coordinate = Coordinate.new(array[1].to_i,array[0].to_i)
		coordinate
	end

	#Return number of driver
	def number_driver
		@array_translate.length-2
	end

	#Return array of driver object
	def array_of_driver
		number = @array_translate.length-1
		array_driver = []
		(2..number).each do |index|
			driver_obj = Driver.new(convert_coordinate(index))
			driver_obj.name = @array_translate[index][0]
			array_driver << driver_obj
		end
		array_driver
	end
end