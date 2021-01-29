# def all_words_capitalized?(arr)
# 	arr.all? do |word|
# 		word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
# 	end
# end

def all_words_capitalized?(arr)
	arr.all? do |word|
		word == word.capitalize
	end
end

# def no_valid_url?(arr)
#  valid_end = ['com', 'net', 'io','org']
#  arr.none? do |url|
# 	top_level = url.split('.')[1]
# 	valid_end.include?(top_level)
#  end
# end

def no_valid_url?(arr)
 valid_end = ['.com', '.net', '.io','.org']
 arr.none? do |url|
	valid_end.any? {|ending| url.end_with?(ending) }
 end
end

def any_passing_students?(arr)
	arr.any? do |student|
		(student[:grades].sum / student[:grades].length) >= 75
	end
end