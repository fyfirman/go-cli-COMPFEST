require_relative 'coordinate.rb'
require_relative 'maps.rb'
require_relative 'user.rb'
require_relative 'driver.rb'
require_relative 'read_file.rb'

class Generator
	attr_accessor :maps
	attr_accessor :user
	attr_accessor :destination

	def initialize(*args)
		@array_of_driver = []
		@cost = 300
		@destination = nil
		generate_maps(args)
	end

	def generate_maps(*args)
		case args.length
		when 0
			# read_file = Read_file.new(args[0])
			# add_user(read_file.user_coordinate.x,read_file.user_coordinate.y)
			# @array_of_driver = read_file.array_of_driver
			# add_drivers(read_file.number_driver,read_file.array_of_driver)
		when 3
			@maps = Maps.new(args[0][0])
			# puts "Argumen1,Argumen2 = #{args[0][1]}, #{args[0][2]}"
			add_user(args[0][1],args[0][2])
			add_drivers(5)
		else
			@maps = Maps.new(20)
			add_user
			add_drivers(5)
		end
	end

	def add_user(*args)
		# puts "Argumen1,Argumen2 = #{args[0]}, #{args[1]}"
		if args.length == 0
			@user = User.new(random_location)
		else
			@user = User.new(Coordinate.new(args[0],args[1]))	
		end

		@maps.set_value(@user.location,1) #1 is to indicate User
	end

	def add_drivers(number, *args)
		# array_of_driver = []
		case args.length
		when 0
			number.times do 
				driver_obj = Driver.new(random_location)
				@array_of_driver << driver_obj

				@maps.set_value(driver_obj.location,2) #2 is to indicate drivers
			end
		else
			puts "ERRRRRRRRRRRRRRRRRRROOOOOO"
		end
		# array_of_driver
	end

	def random_location
		candidate_location =  Coordinate.new(@maps.mapsize)
		while @maps.value(candidate_location) != 0
			candidate_location =  Coordinate.new(@maps.mapsize)
		end
		candidate_location
		# puts "#{candidate_location.x},#{candidate_location.y}"
	end

	def nearest_driver
		candidate_driver = nil
		minimum_distance = 2*@maps.mapsize
		@array_of_driver.each do |driver|
			distance = distance(@user.location, driver.location)
			if distance < minimum_distance
				candidate_driver = driver
				minimum_distance = distance
			end 
		end
		candidate_driver
	end

	def distance(location_a, location_b)
		(location_a.x - location_b.x).abs + (location_a.y - location_b.y).abs
	end

	def price(distance)
		@cost*distance
	end
end

# gocli = Generator.new(10,2,3)
# gocli.distance()
# puts gocli.find_nearest_driver.name