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

	
	
	```ruby 

	```

	
	
	```ruby 

	```

	
	
	```ruby 

	```

	