def all_words_capitalized?(arr)
	arr.all? do |word|
		word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
	end
end

def no_valid_url?(arr)
 valid_end = ['com', 'net', 'io','org']
 arr.none? do |url|
	top_level = url.split('.')[1]
	valid_end.include?(top_level)
 end
end