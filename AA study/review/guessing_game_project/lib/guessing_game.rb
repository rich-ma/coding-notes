class GuessingGame
 def initialize(min, max)
	@min = min
	@max = max
	@secret_num = rand(min..max)
	@game_over = false
	@num_attempts = 0
 end

 def check_num(num)
	@num_attempts += 1
	if num == @secret_num
		@game_over = true
		p "you win"
	elsif num > @secret_num
		p 'too big'
	else
		p 'too small'
	end
 end


end
