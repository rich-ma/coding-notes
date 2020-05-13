# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
	result = ''
	i = 0
	while i <= str.length - 1
		count = 1
		j = i + 1
		while(str[j] == str[i])
			count += 1
			j += 1
		end

		if count > 1
			result << count.to_s + str[i] 
		else
			result << str[i]
		end
		
		i += count
	end

	result
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
