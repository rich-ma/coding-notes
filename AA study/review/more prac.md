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

	