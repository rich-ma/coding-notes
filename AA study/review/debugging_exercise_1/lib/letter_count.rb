# Debug this code to pass rspec! There are 3 mistakes to fix.

# Write a method, letter_count, that accepts a string and char as args. 
# The method should return the number of times that the char appears in the string.

require "byebug"

def letter_count(string, char)
		count = 0
		string.each_char do |c|
				count += 1 if c == char
    end
    count
end

#count cant be nil, or count += 1 will not function properly
# if statement conditional is evaluating to true each check 
# need to change the assignment operator(=) to a comparative operator(==)
