class Hangman
	DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

	def self.random_word
		DICTIONARY.sample
	end
	
	def initialize()
		@secret_word = Hangman.random_word
		@guess_word = Array.new(@secret_word.length, '_')
		@attempted_chars = []
		@remaining_incorrect_guesses = 5
	end

	#getters
	def remaining_incorrect_guesses
		@remaining_incorrect_guesses
	end

	def attempted_chars
		@attempted_chars
	end

	def guess_word
		@guess_word
	end

	def already_attempted?(char)
		@attempted_chars.include?(char)
	end

	def get_matching_indices(char)
		indices = []
		@secret_word.chars.each_with_index {|ch, i| indices << i if ch == char}
		indices
	end

	def fill_indices(char, indices)
		indices.each {|i| @guess_word[i] = char}
	end

	def try_guess(char)
		if already_attempted?(char)
			p "that has already been attempted"
			return false
		else
			@attempted_chars << char
			indices = get_matching_indices(char)

			if indices.empty?
				@remaining_incorrect_guesses -= 1
			else
				fill_indices(char, indices)
			end

			return true
		end
	end

	def ask_user_for_guess
			print 'Enter a char:'
			char = gets.chomp
			try_guess(char)
	end

	def win?
		if @guess_word.join('') == @secret_word
			print "WIN"
			return true
		else
			return false
		end
	end

	def lose?
		if @remaining_incorrect_guesses <= 0
			print "LOSE"
			return true
		else
			return false
		end
	end

	def game_over?
		if self.win? || self.lose?
			p @secret_word
			return true
		else
			return false
		end
	end

end