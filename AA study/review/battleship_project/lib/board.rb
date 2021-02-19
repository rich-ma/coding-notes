class Board
	attr_reader :size

	def initialize(n)
		@grid = Array.new(n){Array.new(n, :N)}
		@size = n*n
	end

	def [](pos)
		@grid[pos[0]][pos[1]]
	end

	def []=(pos, val)
		@grid[pos[0]][pos[1]] = val
	end

	def num_ships
		count = 0
		@grid.each do |row|
			count += row.count {|val| val == :S }
		end

		count
	end

	
  
end
