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

#guarantee sort is done by going through every iteration
#can also use a swap var that sees if anything was swapped this iteration, if not, sort is done(premature opt?)



p bubble_sort([88, 25, 73, 5, 16, 35, 42, 99, 1])

