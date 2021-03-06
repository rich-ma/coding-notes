# advanced practice


	Map By Name
Write a method map_by_name  that takes in an array of hashes and returns a new array containing the names of each hash.
	```ruby 
def map_by_name(arr)
	arr.map {|el| el['name']}
end


pets = [
  {"type"=>"dog", "name"=>"Rolo"},
  {"type"=>"cat", "name"=>"Sunny"},
  {"type"=>"rat", "name"=>"Saki"},
  {"type"=>"dog", "name"=>"Finn"},
  {"type"=>"cat", "name"=>"Buffy"}
]
print map_by_name(pets) #=> ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]
puts

countries = [
 {"name"=>"Japan", "continent"=>"Asia"},
 {"name"=>"Hungary", "continent"=>"Europe"},
 {"name"=>"Kenya", "continent"=>"Africa"},
]
print map_by_name(countries) #=> ["Japan", "Hungary", "Kenya"]
	```
- simply just using map to return a new array that contains only the names of each hash object
	

	Map By Key
Write a method map_by_key that takes in an array of hashes and a key string. The method should returns a new array containing the values from each hash for the given key.
	```ruby 
def map_by_key(arr, key)
	arr.map {|el| el[key]}
end

locations = [
  {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},
  {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},
  {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},
]

print map_by_key(locations, "state") #=> ["New York", "California", "Oregon"]
puts
print map_by_key(locations, "city") #=> ["New York City", "San Francisco", "Portland"]
puts
	```
	- another simple one to retreive a specific key and return as an array

	
	Yell Sentence
Write a method yell_sentence that takes in a sentence string and returns a new sentence where every word is yelled. See the examples. Use map to solve this.
	```ruby 
def yell_sentence(sent)
 sent.split(' ').map {|word| word.upcase + '!'}.join(' ')
end
def yell_sentence(sent)
	word_array = sent.split

 	word.map {|word| word.upcase + '!'}.join(' ')
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"
	```

	
	O Words
Write a method o_words that takes in a sentence string and returns an array of the words that contain an "o". Use select in your solution!
```ruby 
def o_words(sentence)
	sentence.split(' ').select {|word| word.include?('o') || word.include?('O')}
end

print o_words("How did you do that?") #=> ["How", "you", "do"]
puts
```
- use select and include? to find words that have an o in it. 

	
	Last Index
Write a method last_index that takes in a string and a character. The method should return the last index where the character can be found in the string.
	```ruby 
def last_index(str, char)
  str.rindex(char)
end

def last_index(str, char)
  (str.length - 1).downto(0) do |i|
    if str[i] == char
      return i
    end
  end
end

puts last_index("abca", "a")       #=> 3
puts last_index("mississipi", "i") #=> 9
puts last_index("octagon", "o")    #=> 5
puts last_index("programming", "m")#=> 7
	```
- used rindex to get reversed index
- also used downto to go from the reverse manually
	
Most Vowels
Write a method most_vowels that takes in a sentence string and returns the word of the sentence that contains the most vowels.	
	```ruby 
def most_vowels(sentence)
  result = ''
  count = 0
 sentence.split.each do |word|
   new_count = word.count('/aeiou/')
   if new_count > count
     count = new_count
     result = word
   end
 end
  
  result
end

print most_vowels("what a wonderful life") #=> "wonderful"
	```
	- split each word, count the vowels using count and regex
	- store the highest vowel count and return it

Prime
Write a method prime? that takes in a number and returns a boolean, indicating whether the number is prime. A prime number is only divisible by 1 and itself.
```ruby 
def prime?(num)
  return false if num < 0
  return true if num == 1 || num == 2
  return false if num % 2 == 0
  
  3.upto(Math.sqrt(num)) do |i|
    return false if num % i == 0
  end
  true
end

```
- check if num is < 0
- check if num == 1 or 2
- remove all even numbers
- going to the sqrt of a value is the most efficient way, you can go to num/2 as well, or num/2 - 1 to be safe
	
	
	Pick Primes
Write a method pick_primes that takes in an array of numbers and returns a new array containing only the prime numbers.
```ruby 
def pick_primes(numbers)
	numbers.select {|num| prime?(num)}
end

def prime?(num)
  return false if num < 0
  return true if num == 1 || num == 2
  return false if num % 2 == 0
  
  3.upto(Math.sqrt(num)) do |i|
    return false if num % i == 0
  end
  true
end

	```
	- use select and prime?(num) to determine which are prime values

	
	Prime Factors
Write a method prime_factors that takes in a number and returns an array containing all of the prime factors of the given number.
	```ruby 
def prime_factors(num)
  (2..num/2).select do |i|
    num % i == 0 && prime?(i)
  end
end

def prime?(num)
  return false if num < 0
  return true if num == 1 || num == 2
  return false if num % 2 == 0
  
  3.upto(Math.sqrt(num)) do |i|
    return false if num % i == 0
  end
  true
end
  
print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts
	```
- go from 2 up to num/2 and check for primes that are also factors.  num/2 is probably uneccessary, sqrt num is probably better
	

Greatest Factor Array
Write a method greatest_factor_array that takes in an array of numbers and returns a new array where every even number is replaced with it's greatest factor. A greatest factor is the largest number that divides another with no remainder. For example the greatest factor of 16 is 8. (For the purpose of this problem we won't say the greatest factor of 16 is 16, because that would be too easy, ha)
	```ruby
def greatest_factor_array(arr)
  arr.map do |num|
    if prime?(num)
      num 
 	else
      (num/2).downto(2) do |i| 
        puts i
        i if num % i == 0
      end
    end
  end
end

def prime?(num)
  return false if num < 0
  return true if num == 1 || num == 2
  return false if num % 2 == 0
  
  3.upto(Math.sqrt(num)) do |i|
    return false if num % i == 0
  end
  true
end

def greatest_factor_array(arr)
  arr.map {|num| num % 2 == 0 ? num/2 : num}
end

print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts
	```
- misread the prompt, the largest factor only applies to even values.
- just need to return even values/2, the odd values just return. 


Perfect Square
Write a method perfect_square? that takes in a number and returns a boolean indicating whether it is a perfect square. A perfect square is a number that results from multiplying a number by itself. For example, 9 is a perfect square because 3  3 = 9, 25 is a perfect square because 5  5 = 25.
	```ruby
def perfect_square?(num)
	Math.sqrt(num) == (Math.sqrt(num)).floor
end

def perfect_square?(num)
	return true if num == 1
	(1..num/2).each {|i| return true if i * i == num}
	false
end


puts perfect_square?(5)   #=> false
puts perfect_square?(12)  #=> false
puts perfect_square?(30)  #=> false
puts perfect_square?(9)   #=> true
puts perfect_square?(25)  #=> true
	```
- just use sqrt again? 
- if not we can go from half down to 1 check from perfect squares along the way. 
- will have to account for 1 being an edge case

Triple Sequence
Write a method triple_sequence that takes in two numbers, start and length. The method should return an array representing a sequence that begins with start and is length elements long. In the sequence, every element should be 3 times the previous element. Assume that the length is at least 1.
	```ruby
def triple_sequence(start, length)
  result = [start]
  (length - 1).times {result << result[-1] * 3}
  result
end

print triple_sequence(2, 4) # => [2, 6, 18, 54]
puts
print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
puts
	```
	- start an array at [start]
	- iterate length-1 times to make up for starting with the start value
	- initially did (1..length).map and then multipled by start * index(3) but is more convoluted that way



Summation Sequence
A number's summation is the sum of all positive numbers less than or equal to the number. For example: the summation of 3 is 6 because 1 + 2 + 3 = 6, the summation of 6 is 21 because 1 + 2 + 3 + 4 + 5 + 6 = 21. Write a method summation_sequence that takes in a two numbers: start and length. The method should return an array containing length total elements. The first number of the sequence should be the start number. At any point, to generate the next element of the sequence we take the summation of the previous element. You can assume that length is not zero.
	```ruby
def summation_sequence(start, length)
  result = [start]
  
  (length-1).times do
    result << (1..result[-1]).reduce(:+)
  end
  
  result
end
	```
- used reduce to add the values from 1 to the previous value
- if it was a more advanced question, we could store the value of every summation in a hash object that way we could easily access previously known values to save time



Fibonacci
The fibonacci sequence is a sequence of numbers whose first and second elements are 1. To generate further elements of the sequence we take the sum of the previous two elements. For example the first 6 fibonacci numbers are 1, 1, 2, 3, 5, 8. Write a method fibonacci that takes in a number length and returns the fibonacci sequence up to the given length.
	```ruby
def fibonacci(length)
  return [] if length == 0
  return [1] if length == 1
  fibb = [1, 1]
  (length - 2).times {fibb << fibb[-1] + fibb[-2]}
  
  fibb
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts

def fibonacci_rec(length)
  return [] if length == 0
  return [1] if length == 1
  return [1,1] if length == 2
  
  prev_fibb = fibonacci_rec(length - 1)
  
  prev_fibb << prev_fibb[-1] + prev_fibb[-2]
  
  prev_fibb
end
	```
	- iterative solve with cases for 0 and 1 length
	- iterate length - 2 times since we start with [1,1]
	could also just do a while arr.length < length
	
- added a recursive method, with 3 base cases, depending on the length given.  
- covers cases where length <=2
- can also do this dynamically by returning the values at each location and storing them
- not as relevant in this situation since we are building the actual sequence instead of getting a value of a specific location


Caesar Cipher
Write a method caesar_cipher that takes in a string and a number. The method should return a new string where every character of the original is shifted num characters in the alphabet.
	```ruby
# Feel free to use this variable:
# alphabet = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  (0...str.length).each do |i|
    index = alphabet.index(str[i])
    new_index = (index + num) % alphabet.length
  	str[i] = alphabet[new_index]
  end
	
  str
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"
	```
- we use alphabet to retreive the correct index of each letter
- we iterate over each letter in the str
- store that index, add it to the shift value, then mod the length of the alphabet for when it cycles back around
- this does modify the original str



Vowel Cipher
Write a method vowel_cipher that takes in a string and returns a new string where every vowel becomes the next vowel in the alphabet.
	```ruby
def vowel_cipher(string)
  vowels = 'aeiou'
  string.split('').map do |ch|
    if vowels.include?(ch)
      index = vowels.index(ch)
      vowels[(index + 1) % vowels.length]
    else
      ch
    end
  end.join('')
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap
	```
	- take similar approach to alphabet, but this time just vowels
- tried a method similar to alphabet, but ran into issues with nil conversion somewhere along the time


Double Letter Count
Write a method that takes in a string and returns the number of times that the same letter repeats twice in a row.
	```ruby
def double_letter_count(string)
  count = 0
  string.chars.each_with_index do |ch, i|
    count += 1 if ch == string[i + 1]
  end
  
  count
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1
	```



Adjacent Sum
Write a method adjacent_sum that takes in an array of numbers and returns a new array containing the sums of adjacent numbers in the original array. See the examples.
	```ruby
def adjacent_sum(arr)
 (0...arr.length - 1).map do |i|
   arr[i] + arr[i + 1]
 end
end

print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13], because [ 3+7, 7+2, 2+11 ]
puts
print adjacent_sum([2, 5, 1, 9, 2, 4]) #=> [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]
puts
	```

Pyramid Sum
Write a method pyramid_sum that takes in an array of numbers representing the base of a pyramid. The function should return a 2D array representing a complete pyramid with the given base. To construct a level of the pyramid, we take the sum of adjacent elements of the level below.
```ruby 
# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
  height = base.length
  pyramid = [base]
  
  while pyramid.length < height 
    prev_arr = pyramid[0]
    new_arr = Array.new(prev_arr.length - 1, 0)
    new_arr.each_index {|i| new_arr[i] = prev_arr[i] + prev_arr[i + 1]}
    pyramid.unshift(new_arr)
  end
  
  pyramid
end

print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts
```
- pretty clean approach, we create each new level of the pyramid from the size of the previous one - 1
- using array initialization to use previous layer size-1, and default of 0
- simply unshift it into the result pyramid array


All Else Equal
Write a method all_else_equal that takes in an array of numbers. The method should return the element of the array that is equal to half of the sum of all elements of the array. If there is no such element, the method should return nil.
```ruby 
def all_else_equal(arr)
	half = arr.reduce(:+)/2.0
  if arr.index(half)
    return half
  end
  return nil
end


p all_else_equal([2, 4, 3, 10, 1]) #=> 10, because the sum of all elements is 20
p all_else_equal([6, 3, 5, -9, 1]) #=> 3, because the sum of all elements is 6
p all_else_equal([1, 2, 3, 4])     #=> nil, because the sum of all elements is 10 and there is no 5 in the array
```



Anagrams
Write a method anagrams? that takes in two words and returns a boolean indicating whether or not the words are anagrams. Anagrams are words that contain the same characters but not necessarily in the same order. Solve this without using .sort
```ruby 
def anagrams?(word1, word2)
  return false if word1.length != word2.length
  
  word1_hash = Hash.new(0)
  word1.chars.each {|ch| word1_hash[ch] += 1}
  
  word2.chars.each do |ch|
    word1_hash[ch] -= 1
    return false if word1_hash[ch] < 0
  end
  
  true
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false
```
- store the first word in a hash, counting the individual ch
- going through each ch in the second word, we reduce the count of the hash, and return false if any drop below 0
- early false case if the lengths are not the same



Consonant Cancel
Write a method consonant_cancel that takes in a sentence and returns a new sentence where every word begins with it's first vowel.
```ruby 
def consonant_cancel(sentence)
  sentence.split.map do |word|
    vowel_index = word.index(/[aeiou]/)
    word[vowel_index..-1]
  end.join(' ')
end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"
```
- split each word
- use regex to find the first vowel
- use spread operator to 



Same Char Collapse
Write a method same_char_collapse that takes in a string and returns a collapsed version of the string. To collapse the string, we repeatedly delete 2 adjacent characters that are the same until there are no such adjacent characters. If there are multiple pairs that can be collapsed, delete the leftmost pair. For example, we take the following steps to collapse "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy
```ruby
def same_char_collapse(str)
  start = 0
  i = 0
  while i < str.length
    p [str, i]
    if str[i] == str[i + 1]
      p ['if',i, i + 1]
      str = str[0...i] + str[(i + 2)..-1]
      puts str
    elsif str[i - 1] == str[i]
      p ['else', i - 1, i]
      str = str[0...i - 1] + str[i + 1 .. -1]
      i -= 1
    else
      i += 1
    end
  end
  
  str
end
puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv
```
- go through each character in the string, check if the string at index and index + 1/-1 are the same, and then 'slicing'
- for index + index - 1, there is a possibility that i - 1 and i - 2 could be the same, so we drop i by 1 for that situation



