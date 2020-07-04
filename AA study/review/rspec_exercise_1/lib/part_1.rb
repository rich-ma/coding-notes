def average(num1, num2)
	(num1 + num2)/2.0
end

def average_array(arr)
	arr.sum()/(arr.length.to_f)
end

def repeat(str, num)
	result = ''
	num.times { result << str }
	result
end

def yell(str)
	str.chars.map {|ch| ch.upcase()}.join('') + '!'
end

def alternating_case(str)
	str.split(' ').map.with_index do |word, i|
		if(i % 2 == 0)
			word.upcase()
		else
			word.downcase()
		end
	end.join(' ')
end