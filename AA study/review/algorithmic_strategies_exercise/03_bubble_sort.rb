# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort
def bubble_sort(arr)
	
	j = arr.length - 1

	while(j > 0)
		swapped = false
		(0...j).each do |i|
			if arr[i] > arr[i + 1]
				swapped = true
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
			end
		end

		break	if swapped == false

		 j -= 1
	end

	arr
end

def bubble_sort!(arr)
	

end


p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]