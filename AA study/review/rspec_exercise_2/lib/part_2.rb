def palindrome?(str)
	(str.length/2).times do |i|
		return false if str[i] != str[-i - 1]
	end
	true
end

def substrings(str)
	result = []
	str.chars.each_with_index do |ch, i|
		j = i
		while j < str.length
			result << str[i..j]
			j += 1
		end
	end

	result
end

def palindrome_substrings(str)
	results = []
	substrings = substrings(str)
	substrings.each do |sub|
		if sub.length > 1 && palindrome?(sub)
			results << sub
		end
	end
	results
end