class Coordinate
	attr_accessor :x
	attr_accessor :y
	def initialize(*args)
		case args.length
		when 1
			@x = rand(1...args[0])
			@y = rand(1...args[0])
		when 2
			@x,@y = args
		else
			raise ArgumentError, "Invalid arguments. You give #{args.length} arguments."
		end
	end
end
