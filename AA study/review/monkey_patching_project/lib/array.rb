# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
	def span
		return nil if self.length == 0
		temp_arr = self.sort
		temp_arr[-1] - temp_arr[0]
	end

	def average
		return nil if self.length == 0
		self.sum / (self.length).to_f
	end

	def median
		length = self.length
		if length == 0
			return nil
		elsif length % 2 == 1
			return self.sort[length/2]
		else
			return (self.sort[length/2] + self.sort[length/2 - 1])/2.0
		end
	end

	def counts
		count_hash = Hash.new(0)
		self.each do |el|
			count_hash[el] += 1
		end
		count_hash
	end
	
end
