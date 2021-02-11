class Dog
	def initialize(name, breed, age, bark, favorite_foods)
		@name = name
		@breed = breed
		@age = age
		@bark = bark
		@favorite_foods = favorite_foods
	end

	#getters
	def name
		@name
	end

	def breed
		@breed
	end

	def age
		@age
	end

	def bark
		if @age > 3
			@bark.upcase
		else
			@bark.downcase
		end
	end

	def favorite_foods
		@favorite_foods
	end

	#setters
	def age=(num)
		@age = num
	end

	#methods
	def favorite_food?(str)
		@favorite_foods.include?(str.capitalize)
	end





end
