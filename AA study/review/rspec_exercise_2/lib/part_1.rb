def partition(arr, n)
	part_1 = []
	part_2 = []
	arr.each do |el|
		el >= n ? part_2 << el : part_1 << el
	end
	[part_1, part_2]
end

def merge(hash_1, hash_2)
	merged_hash = hash_1.clone
	hash_2.each { |key, val| merged_hash[key] = val }
	merged_hash
end

def censor(str, arr)
	str.split(' ').map do |word|
		if arr.include?(word.downcase)
			censorfy(word)
		else
			word
		end
	end.join(' ')
end

def censorfy(word)
	vowels = 'aeiou'
	word.chars.map do |ch|
		if vowels.include?(ch.downcase)
			'*'
		else
			ch
		end
	end.join('')
end

def power_of_two?(n)
	# return true if n == 1
	# return false if n % 2 == 1
	(Math.log(n) / Math.log(2)).to_i == (Math.log(n) / Math.log(2))
end

puts power_of_two?(1)