def select_even_nums(arr)
 arr.select(&:even?)
end

def reject_puppies(arr)
	arr.reject{|dog| dog['age'] <= 2}
end

def count_positive_subarrays(arr)
	arr.count{|el| el.inject(0){|sum,i| sum + i} > 0}
end