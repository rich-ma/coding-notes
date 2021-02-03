def reverser(str, &prc)
	result = str.reverse
	prc.call(result)
end

def word_changer(str, &prc)
	str.split(' ').map { |el| prc.call(el)}.join(' ')
end

def greater_proc_value(num, prc_1, prc_2)
	result_1 = prc_1.call(num)
	result_2 = prc_2.call(num)
	result_1 > result_2 ? result_1 : result_2
end

def and_selector(arr, prc_1, prc_2)
	arr.select { |el| prc_1.call(el) && prc_2.call(el)}
end

def alternating_mapper(arr, prc_1, prc_2)
	arr.map.with_index do |el, i|
		if i % 2 == 0
			prc_1.call(el)
		else
			prc_2.call(el)
		end
	end
end