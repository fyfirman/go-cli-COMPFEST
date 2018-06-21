require_relative 'coordinate.rb'

class Driver
	attr_accessor :location
	attr_accessor :name
	def initialize(*name, coordinate)
		@location = coordinate
		if !name.empty?
			@name = name
		else
			@name = random_name()
		end
	end

	#Generate random name
	def random_name
		@random_name = ["Asep", "Dadang", "Jajang", "Dede", "Joko", "Deni", "Agung", "Usep", "Dani", "David", "Arif","Andre", "Ananda"]
		@random_name.shuffle!.pop
	end
end