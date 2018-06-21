require_relative 'coordinate.rb'
require_relative 'maps.rb'
require_relative 'user.rb'
require_relative 'driver.rb'
require_relative 'read_file.rb'

class Generator
	attr_accessor :maps
	attr_accessor :user
	attr_accessor :destination

	def initialize
		@array_of_driver = []
		@cost = 300
		@destination = nil
	end

	#Generate maps depends on parameter
	def generate_maps(args)
		case args.size

		when 1 #parameter filename
			read_file = Read_file.new(args[0])
			@maps = Maps.new(read_file.mapsize)
			add_user(read_file.user_coordinate.x,read_file.user_coordinate.y)
			@array_of_driver = read_file.array_of_driver
			add_drivers(read_file.number_driver,read_file.array_of_driver)

		when 3 #3 parameter n x y
			args.collect!(&:to_i)
			@maps = Maps.new(args[0])
			add_user(args[2],args[1])
			add_drivers(5)

		else #no parameter
			@maps = Maps.new(20)
			add_user
			add_drivers(5)
		end
	end

	#Add user to the map
	def add_user(*args)
		if args.length == 0
			@user = User.new(random_location)
		else
			@user = User.new(Coordinate.new(args[0],args[1]))	
		end

		@maps.set_value(@user.location,1) #1 is to indicate User
	end

	#Add (multiple) drivers to the map 
	def add_drivers(number, *args)
		case args.length

		when 0 #Drivers generate aumaticly
			number.times do 
				driver_obj = Driver.new(random_location)
				@array_of_driver << driver_obj

				@maps.set_value(driver_obj.location,2) #2 is to indicate drivers
			end
		
		else #Drivers generate from textfile
			@array_of_driver.each do |driver|
				@maps.set_value(driver.location,2) #2 is to indicate drivers
			end
		end
	end

	#Return random & empty location
	def random_location
		candidate_location =  Coordinate.new(@maps.mapsize)
		while @maps.value(candidate_location) != 0
			candidate_location =  Coordinate.new(@maps.mapsize)
		end
		candidate_location
	end

	#Find nearest driver from user
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

	#Calculate distance within 2 location
	def distance(location_a, location_b)
		(location_a.x - location_b.x).abs + (location_a.y - location_b.y).abs
	end

	#Calculate price
	def price(distance)
		@cost*distance
	end
end