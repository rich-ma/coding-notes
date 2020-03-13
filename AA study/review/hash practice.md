Hash Cheat Sheet
Here is a quick reference for the methods and operations we learned in the previous lectures!

Access
hash = { "name" => "App Academy", "color" => "red" }

p hash["color"]  # prints "red"
p hash["age"]    # prints nil

k = "color"
p hash[k]        # prints "red"

hash["age"] = 5
p hash           # prints {"name"=>"App Academy", "color"=>"red", "age"=>5}
Checking Existence
hash = { "name" => "App Academy", "color" => "red" }

p hash.has_key?("name")             # prints true
p hash.has_key?("age")              # prints false
p hash.has_key?("red")              # prints false

p hash.has_value?("App Academy")    # prints true
p hash.has_value?(20)               # prints false
p hash.has_value?("color")          # prints false
Hash Enumerable Methods
hash = { "name" => "App Academy", "color" => "red" }

hash.each { |key, val| p key + ', ' + val} # prints
# "name, App Academy"
# "color, red"

hash.each_key { |key| p key } # prints
# "name"
# "color"

hash.each_value { |val| p val } # prints
# "App Academy"
# "red"
Hash.new
  plain_hash = { }
  plain_hash["city"] = "SF"
  p plain_hash["city"]    # prints "SF"
  p plain_hash["country"] # prints nil

  hash_with_default = Hash.new("???")
  hash_with_default["city"] = "NYC"
  p hash_with_default["city"]    # prints "NYC"
  p hash_with_default["country"] # prints "???"


Get Full Name
Write a method get_full_name that takes in a hash containing a first, last, and title. The method should return a string representing the hash's full name
	```ruby 
	def get_full_name(hash)
	return hash['first'] + ' ' + hash['last'] + ', the ' + hash['title']
end

hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}
puts get_full_name(hash1) # => "Michael Jordan, the GOAT"

hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}
puts get_full_name(hash2) # => "Fido McDog, the Loyal"
	```
	- simple hash accessing + string concatenation


Word Lengths
Profile
Word Lengths
Write a method word_lengths that takes in a sentence string and returns a hash where every key is a word of the sentence, and its' corresponding value is the length of that word.
	```ruby 
	def word_lengths(sentence)
  hash = Hash.new()
	sentence.split(' ').each do |word|
      hash[word] = word.length
    end
  
  hash
end

puts word_lengths("this is fun") #=> {"this"=>4, "is"=>2, "fun"=>3}
puts word_lengths("When in doubt, leave it out") #=> {"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}
	```
- super simple, doesn't address words that are repeated.

	Ae Count
Write a method ae_count that takes in a string and returns a hash containing the number of a's and e's in the string. Assume the string contains only lowercase characters.
	```ruby 
def ae_count(str)
 hash = Hash.new(0)
  str.each_char do |ch|
    if ch == 'a' || ch == 'e'
      hash[ch] += 1
    end
  end
  hash
end
	```
- check if the ch are a or e, increase the count by 1
- declare a hash with default value 0
	

	Select Upcase Keys
Write a method select_upcase_keys that takes in a hash and returns a new hash containing key-value pairs of the original hash that had uppercase keys. You can assume that the keys will always be strings.
	```ruby 
def select_upcase_keys(hash)
  resultHash = Hash.new()
	hash.each do |key, val|
      if key == key.upcase
        resultHash[key] = val
      end
    end
  
  resultHash
end

print select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4}) # => {"MODEL"=>"S", "SEATS"=>4}
puts

print select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"}) # => {"DATE"=>"July 4th"}
puts
	```
- iterate over each key value pair, compare key to fully uppercase key

Hand Score
Write a method hand_score that takes in a string representing a hand of cards and returns it's total score. You can assume the letters in the string are only A, K, Q, J. A is worth 4 points, K is 3 points, Q is 2 points, and J is 1 point. The letters of the input string not necessarily uppercase.
	```ruby 
def hand_score(hand)
  card_hash = { 'A' => 4, 'K' => 3, 'Q' => 2, 'J' => 1}
  score = 0
  
  hand.each_char {|ch| score += card_hash[ch.upcase] }
  
  score

end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9
	```
	- we create a hash object to store the card and their values
	- we iterate over each 'card'(ch) in the hand and add the value to a score

	Frequent Letters
Write a method frequent_letters that takes in a string and returns an array containing the characters that appeared more than twice in the string.
	```ruby 
	def frequent_letters(str)
		result_hash = Hash.new(0)
		str.each_char {|ch| result_hash[ch] += 1}

		result_hash.select {|key ,val| val >= 2}

	end

		def frequent_letters(str)
		result_hash = Hash.new(0)
		str.each_char {|ch| result_hash[ch] += 1}

		result_hash.keys.select {|key| result_hash[key] > 2}

	end
	```

	Hash To Pairs
Write a method hash_to_pairs that takes in a hash and returns a 2D array representing each key-value pair of the hash.
	```ruby 
def hash_to_pairs(hash)
	hash.to_a
end

def hash_to_pairs(hash)
	result = []
  hash.each {|k,v| result << [k,v]}
  result
end


print hash_to_pairs({"name"=>"skateboard", "wheels"=>4, "weight"=>"7.5 lbs"}) #=> [["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]
puts


print hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis", "breed"=>"German Shepherd"}) #=> [["kingdom", "animalia"], ["genus", "canis"], ["breed", "German Shepherd"]]
puts
	```

	Unique Elements
Write a method unique_elements that takes in an array and returns a new array where all duplicate elements are removed. Solve this using a hash.
	```ruby 
		# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
	hash = Hash.new(0)
	arr.each {|el| hash[el] += 1}

	hash.keys
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts
	```

	Element Replace
Write a method element_replace that takes in an array and a hash. The method should return a new array where elements of the original array are replaced with their corresponding values in the hash.
	```ruby 
def element_replace(arr, hash)
	arr.map do |el|
      if hash[el]
        hash[el]
      else
        el
      end
    end
end

arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
print element_replace(arr1, hash1) # => ["basketball", "Lionel Messi", "tennis"]
puts

arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
print element_replace(arr2, hash2) # => ["bork", "meow", "mouse"]
puts
	```

	
	```ruby 

	```

	
	```ruby 

	```

	
	```ruby 

	```

	
	```ruby 

	```

	
	```ruby 

	```

	