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

	def my_count(val)
		count = 0
		self.each {|el| count += 1 if el == val}
		count
	end

	def my_index(val)
		self.each_with_index {|el, i| return i if el == val}
		nil
	end

	def my_uniq
		uniq_arr = []
		arr_hash = Hash.new(false)
		self.each do |el|
			uniq_arr << el unless arr_hash[el]
			arr_hash[el] = true
		end
		uniq_arr
	end

	def my_transpose
		new_arr = Array.new(self.length){Array.new(self.length)}
		self.each_with_index do |arr, i|
			arr.each_with_index do |el, j|
				new_arr[j][i] = el
			end
		end
		new_arr
	end
	
end
