def partition(arr, n)
	part_1 = []
	part_2 = []
	arr.each do |el|
		el >= n ? part_2 << el : part_1 << el
	end
	[part_1, part_2]
end

def merge(hash_1, hash_2)

end