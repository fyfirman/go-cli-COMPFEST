require_relative "maps.rb"
require_relative "generator.rb"
require_relative "coordinate.rb"
require_relative "history.rb"
# require_relative "map.rb"


*input_parameter = ARGV
gocli = Generator.new(input_parameter)
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
	answer = gets.chomp.to_i
	# maps.nearest_driver(answer)
	case answer
	when 1
		system("cls")
		
		gocli.maps.show
		
		system("pause")
	when 2
		system("cls")

		gocli.maps.show

		puts "\n\tWhere would you go? "
		print "\t*Destination (vertically,horizontally) \t: "
		destination = gets.chomp
		gocli.destination = Coordinate.new(destination[0].to_i,destination[2].to_i)

		puts "\tDriver's name	  \t: #{gocli.nearest_driver.name}"
		puts "\tDriver's location \t: (#{gocli.nearest_driver.location.x},#{gocli.nearest_driver.location.y})\n"
		puts "\n\tFrom (#{gocli.user.location.x},#{gocli.user.location.y}) to (#{destination[0]},#{destination[2]})"
		puts "\tEstimated price \t: #{gocli.price(gocli.distance(gocli.user.location,Coordinate.new(destination[0].to_i,destination[2].to_i)))}"
		
		puts "\n\tConfirm the trip? (Y/N)"
		print "\t*"
		confirm = gets.chomp
		if confirm.upcase == 'Y'
			History.new(gocli).store
			puts "\tTrip is completed!"
			puts "\tThanks for using Go Ride"
		end

		system("pause")
	when 3
		system("cls")
		puts History.new(gocli).view
		system("pause")
	when 0
		break
	else
		puts "Invalid input"
		system("pause")
	end
end
# user
# puts user.test