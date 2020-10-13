def palindrome?(str)
	(str.length/2).times do |i|
		return false if str[i] != str[-i - 1]

	end
true
end