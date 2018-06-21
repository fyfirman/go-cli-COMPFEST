require_relative 'coordinate.rb'

class Read_file
	attr_accessor :array_translate
	def initialize (filename)
		puts filename
		translate(filename)
	end

	def translate(filename)
		@array_translate = []
		File.open(filename).each do |line|
			@array_translate << line.split
		end
	end

	def mapsize
		@array_translate[0][1]
	end

	def user_coordinate
		convert_coordinate(1)
	end

	def convert_coordinate(num)
		array = @array_translate[num][1].split(",")
		coordinate = Coordinate.new(array[0],array[1])
	end

	def number_driver
		@array_translate.length-2
	end
	def driver_object

	end
end

# read = Read_file.new("input.txt")
# puts read.number_driver