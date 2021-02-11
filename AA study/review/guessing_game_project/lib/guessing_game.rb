class GuessingGame
 def initialize(min, max)
	@min = min
	@max = max
	@secret_num = rand(min..max)
	@game_over = false
	@num_attempts = 0
 end

 # getters
 def num_attempts
	 @num_attempts
 end

 def game_over?
	 @game_over
 end

 #game 
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

 def ask_user
	p 'enter a number'
	num = gets.chomp.to_i
	check_num(num)
 end


end
