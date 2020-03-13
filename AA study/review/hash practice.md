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

	