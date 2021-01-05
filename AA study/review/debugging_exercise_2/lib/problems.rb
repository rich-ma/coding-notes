# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'byebug'

def largest_prime_factor(n)
	largest = 0
	(1 .. n).each do |i|
		# debugger
		if n % i == 0 && is_prime?(i)
			largest = i
		end
	end
	largest
end

def is_prime?(n)
	return true if n == 1 || n == 2
	
	(2 .. n/2).each do |i|
		return false if n % i == 0
	end

	true
end

def unique_chars?(str)
 ch_hash = Hash.new(0)
 str.chars.each do |ch|
	ch_hash[ch.downcase] += 1
	 return false if ch_hash[ch.downcase] > 1
 end

 true
end

def dupe_indices(arr)
	result = {}

	arr.each_with_index do |el, i|
		if !result[el]
			result[el] = [i]
		else
			result[el] << i
		end
	end

	result.select {|k, v| v.length > 1}
end

def ana_array(arr1, arr2)
	return false if arr1.length != arr2.length

	arr1_hash = {}
	arr1.each do |el|
		arr1_hash[el] ? arr1_hash[el] += 1 : arr1_hash[el] = 1
	end

	arr2.each do |el|
		if arr1_hash[el]
			arr1_hash[el] -= 1
			return false if arr1_hash[el] < 0
		else
			return false
		end
	end

	true
end