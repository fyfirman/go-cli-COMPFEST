require_relative "coordinate"

class Maps
	attr_accessor :mapsize
	attr_accessor :maps_content

	def initialize(mapsize)
		@mapsize = mapsize
		create(mapsize)
	end
	
	def create(mapsize) #done
		@maps_content = Array.new(mapsize) {Array.new(mapsize,0)}
	end

	def set_value(coordinate,value) #done
		@maps_content[coordinate.x][coordinate.y] = value
	end	

	def value(coordinate)
		@maps_content[coordinate.x][coordinate.y]
	end

	def show 

		puts "\n\t->Your maps \n\n"
		#Printing 0..mapsize + "y" horizontally
		print "\t   "
		0.upto(@maps_content.length-1) do |num|
			if num < 10
				print " #{num} "
			else 
				print "#{num} "
			end
		end
		puts

		#Printing maps with 0..mapsize + "x" vertically
		@maps_content.each_with_index do |sub, index|
			print "\t"
			if index < 10
				print " #{index} "
			else 
				print "#{index} "
			end
			
			sub.each do |value|
				print " "
				if value == 1	#1 for users
					print "Y"
				elsif value == 2	#2 for Driver
					print "G"
				else
					print "."
				end
				print " "
			end
			if index < 10
				print " #{index} "
			else 
				print "#{index} "
			end
			puts "\n"
		end

		#Printing 0..mapsize + "y" horizontally
		print "\t   "
		0.upto(@maps_content.length-1) do |num|
			if num < 10
				print " #{num} "
			else 
				print "#{num} "
			end
		end
		puts 
		puts "\n\t\t\t Y: Your location"
		puts "\t\t\t G: Go-Ride Driver"
		puts 
	end
end

# maps = Maps.new(10)
# puts maps.mapsize