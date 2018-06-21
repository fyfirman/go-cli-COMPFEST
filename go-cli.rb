require_relative "maps.rb"
require_relative "generator.rb"
require_relative "coordinate.rb"
require_relative "history.rb"

*input_parameter = ARGV
gocli = Generator.new
gocli.generate_maps(input_parameter)
ARGV.clear
loop do
	system("cls")
	puts "\t====================================="
	puts "\t=         Go-CLI Application        ="
	puts "\t====================================="
	puts "\t=                                   ="
	puts "\t=    1. Show Map                    ="
	puts "\t=    2. Order Go Ride               ="
	puts "\t=    3. View History                ="
	puts "\t=                                   ="
	puts "\t=                           0. Exit ="
	puts "\t====================================="
	print "\tWhat do you want? "
	answer = $stdin.gets.chomp.to_i

	case answer
	
	when 1 #Show map
		system("cls")
		
		gocli.maps.show
		
		system("pause")

	when 2 #Order Go Ride
		system("cls")

		gocli.maps.show

		puts "\n\tWhere would you go? "
		print "\t*Destination (x,y) \t: "
		destination = gets.chomp
		
		gocli.destination = Coordinate.new(destination[2].to_i,destination[0].to_i)

		puts "\tDriver's name	  \t: #{gocli.nearest_driver.name}"
		puts "\tDriver's location \t: (#{gocli.nearest_driver.location.y},#{gocli.nearest_driver.location.x})\n"
		puts "\n\tFrom (#{gocli.user.location.y},#{gocli.user.location.x}) to (#{destination[0]},#{destination[2]})"
		puts "\tEstimated price \t: #{gocli.price(gocli.distance(gocli.user.location,gocli.destination))}"
		
		puts "\n\tConfirm the trip? (Y/N)"
		print "\t*"
		
		confirm = gets.chomp
		if confirm.upcase == 'Y'
			History.new(gocli).store
			puts "\n\tTrip is completed!"
			puts "\tThanks for using Go Ride"
		end
		
		system("pause")
	
	when 3 #View History
		system("cls")
		
		puts History.new(gocli).view
		
		system("pause")

	when 0 #Exit
		break
	else
		puts "Invalid input"
		system("pause")
	end
end