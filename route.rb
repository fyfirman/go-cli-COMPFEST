require_relative 'coordinate'

class Route
	attr_reader :array_of_route
	def initialize(location_a, location_b)
		get(location_a, location_b)
	end

	def get(start, finish)
		@array_of_route = ["Start at (#{start.y},#{start.x})"]

		#Print go to vertically
		while !(start.x == finish.x)
			if start.x < finish.x
				start.x += 1
			else
				start.x -= 1
			end
			@array_of_route << "Go to (#{start.y},#{start.x})"
		end

		#Print turn left/right
		if(start.y < finish.y)
			@array_of_route << "Turn right"
		else
			@array_of_route << "Turn left"
		end

		#Print go to horizontally
		while !(start.y == 	finish.y)
			if(start.y < finish.y)
				start.y += 1
			else
				start.y -= 1
			end
			@array_of_route << "Go to (#{start.y},#{start.x})"
		end
		
		@array_of_route << "Finish at (#{start.y},#{start.x})"
	end
end
