require_relative "route"

class History
	def initialize(generator)
		@generator = generator
	end

	#Put history into filetext
	def store
		array_of_text = ["\n\t**********************************************************"]
		array_of_text << "\tDriver's name	  \t: #{@generator.nearest_driver.name}"
		array_of_text << "\tDriver's location \t: (#{@generator.nearest_driver.location.x},#{@generator.nearest_driver.location.y})\n"
		array_of_text << "\tFrom (#{@generator.user.location.y},#{@generator.user.location.x}) to (#{@generator.destination.y},#{@generator.destination.x})"
		array_of_text << "\tTotal price 	  \t: #{@generator.price(@generator.distance(@generator.user.location,@generator.destination))}"
		array_of_text << "\tRoutes:"
		array_of_route = Route.new(@generator.user.location,@generator.destination).array_of_route
		array_of_route.each do |line|
			array_of_text << "\t-#{line}"
		end

		File.open("history.txt","a") do |line|
			line.puts(array_of_text)
		end
	end

	#View history from filetext
	def view
			if !File.zero?("history.txt")
				history = File.read("history.txt")
			end
			history
		end

end