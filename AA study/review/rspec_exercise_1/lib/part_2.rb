def hipsterfy(string)
	string = string.reverse()
	index = string.index(/[aeiou]/)
	if index
		string = string.slice(0...index) + string[(index + 1)..-1]
	end
	string.reverse()
end

# def vowel_counts(str)
# 	hash = Hash.new(0)
# 	vowel_arr = str.downcase.scan(/[aeiou]/)
# 	vowel_arr.each { |ch| hash[ch] += 1 }
# 	hash
# end

def vowel_counts(str)
	hash = Hash.new(0)
	str.downcase.chars.each do |ch|
		hash[ch] += 1 if 'aeiou'.include?(ch)
	end
	hash
end

def caesar_cipher(str, n)
	alphabet = ('a'..'z').to_a
	str.chars.map do |ch|
		if alphabet.index(ch)
			alphabet[(alphabet.index(ch) + n) % alphabet.length]
		else
			ch
		end
	end.join('')
end