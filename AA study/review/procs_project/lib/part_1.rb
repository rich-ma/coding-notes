def my_map(array, &prc)
	result = []
	array.each do |el|
		result << prc.call(el)
	end
	result
end

def my_select(arr, &prc)
	result = []
	arr.each do |el|
		result << el if prc.call(el)
	end
	result
end

def my_count(arr, &prc)
	count = 0
	arr.each {|el| count += 1 if prc.call(el)}

	count
end

def my_any?(arr, &prc)
	arr.each {|el| return true if prc.call(el)}
	false
end

def my_all?(arr, &prc)
	arr.each {|el| return false unless prc.call(el)}
	true
end

def my_none?(arr, &prc)
	arr.each {|el| return false if prc.call(el)}
	true
end