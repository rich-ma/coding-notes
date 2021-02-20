class Board
	attr_reader :size

	def initialize(n)
		@grid = Array.new(n){Array.new(n, :N)}
		@size = n*n
	end

	def [](pos)
		row = pos[0]
		col = pos[1]
		@grid[row][col]
	end

	def []=(pos, val)
		row = pos[0]
		col = pos[1]
		@grid[row][col] = val
	end

	def num_ships
		count = 0
		@grid.each do |row|
			count += row.count {|val| val == :S }
		end

		count
	end

	def attack(pos)
		if self[pos] == :S
			self[pos] = :H
			p 'you sunk my battleship!'
			true
		else
			self[pos] = :X
			false
		end
	end

	def place_random_ships
		values = (0...self.size).to_a.sample(self.size/4)
		values.each do |i|
			row = i/@grid.length
			col = i % @grid.length
			self[[row, col]] = :S
		end
	end

	def hidden_ships_grid
		n = Math.sqrt(@size)
		hidden_grid = Array.new(n)
		@grid.each_with_index do |row, i|
			hidden_grid[i] = row.map do |el|
				el == :S ? :N : el
			end
		end

		hidden_grid
	end

	def self.print_grid(grid)
		grid.each do |row|
			puts row.join(' ')
		end
	end

	def cheat
		Board.print_grid(@grid)
	end
	
	def print
		Board.print_grid(hidden_ships_grid)
	end
  
end
