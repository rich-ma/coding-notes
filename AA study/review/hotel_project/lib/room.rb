class Room
	def initialize(capacity)
		@capacity = capacity
		@occupants = []

	end

	#getters
	def capacity
		@capacity
	end

	def occupants
		@occupants
	end

	#methods
	def full?
		@occupants.length >= @capacity
	end

	def available_space
		@capacity - @occupants.length
	end

	def add_occupant(person)
		if self.full?
			false
		else
			@occupants << person
			true
		end
	end

end
