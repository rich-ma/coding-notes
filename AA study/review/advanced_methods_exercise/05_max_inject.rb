# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.
def max_inject(*arr)
	arr.inject {|max, el| el > max ? el : max}
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30

# use inject to bubble the largest value in the arr/arguments up to the end as a return
# we use splat to accept a large number of values like an array