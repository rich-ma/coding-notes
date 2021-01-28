def select_even_nums(arr)
 arr.select(&:even?)
end

def reject_puppies(arr)
	arr.reject{|dog| dog['age'] <= 2}
end

def count_positive_subarrays(arr)
	arr.count{|el| el.sum > 0}
end

# def count_positive_subarrays(arr)
# 	arr.count{|el| el.inject(0){|sum,i| sum + i} > 0}
# end

def aba_translate(str)
	vowels = 'aeiou'
	str.chars.map {|el| vowels.include?(el) ? el + 'b' + el : el }.join('')
end

def aba_array(arr)
	arr.map{ |el| aba_translate(el)}
end