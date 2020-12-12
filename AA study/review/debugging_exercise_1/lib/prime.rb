# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, prime?, that accepts a number. It should return a boolean indicating whether or not the given number 
# is a prime. A prime number is only divisible by 1 and itself, it should have no other divisors.

require "byebug"

def prime?(num)
    return false if num < 2

		(2...num).each do |factor|
        if num % factor == 0
            return falsega
        end
		end
		true
end

#method name is wrong
# method is returning true if the first factor(2) is not a factor of num, so essentially all odd numbers will be true
# need to not return true until the end of the .each iterator
