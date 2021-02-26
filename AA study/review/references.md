# Reference
- in Ruby, variables hold **references** to objects
- = does not mutate or modify an object, it **reassigns** the variable to refer to a different object.
```ruby
my_object = Object.new
# my_object now refers to a new instance of Object

my_object = Object.new
# a new Object instance is created, and the my_object variable is
# reassigned so that it now refers to this object, rather than the old
# object.

# call `my_method` on the object that `my_object` refers to
my_object.my_method
```

## The []= and accessor methods
- if = never modifies an object, what happens with the following?
```ruby
my_hash = {}
# add a key & value to the hash
my_hash[:key] = :value
```
- here we ask ruby to mutate my_hash to that :key refers to :value
- what is happening is ruby is calling the []= method 
- my_hash.[]=(:key, :value), shorthanded to my_hash[:key] = :value

# Array/Hash Defaults
- When creating arrays and hashes with default values, one common issue is seen here:

```ruby
[4] pry(main)> arr_of_arrs = Array.new(3, [])
=> [[], [], []]
[5] pry(main)> arr_of_arrs[0] << "a"
=> ["a"]
[6] pry(main)> arr_of_arrs
=> [["a"], ["a"], ["a"]]
```
-modifying one of the arrays, ends up modifying all of them as they all point/refer to the same array.

```ruby
[7] pry(main)> arr_of_arrs = Array.new(3) { Array.new }
=> [[], [], []]
[8] pry(main)> arr_of_arrs[0] << "a"
=> ["a"]
[9] pry(main)> arr_of_arrs
=> [["a"], [], []]
```
- to solve this, we need to pass a block to the Array.new that runs for each new array created.


## Mutable vs immutable
```ruby
arr2 = Array.new(3, 1)

arr2[0] += 1
arr2[0] == 2 # true
arr2[1] == 1 # true
arr2[2] == 1 # true 
```
- why do arr[1] and arr[2] not both show ==2 here?  
- thats because Integers and Floats are immutable.  They create a new value instead
- First, fetch the number at position 0 (which is 1).
- Next, add one to this number. This creates a new number object. The + operation does not mutate the original object.
- Finally, assign a reference to the new object (2) to position 0 of arr.


## Hash default values
- hash default values have the same issues as the arrays
```ruby
[1] pry(main)> cats = Hash.new([])
=> {}
[2] pry(main)> cats["Devon"]
=> []
[3] pry(main)> cats
=> {}
```
- Providing a default value for a hash doesn't assign a value to all possible keys, but instead changes what is returned when we look up a key that isn't present.

```ruby
[4] pry(main)> cats["Devon"] += ["Earl"]
=> ["Earl"]
[5] pry(main)> cats
=> {"Devon"=>["Earl"]}
[6] pry(main)> cats["Devon"] += ["Breakfast"]
=> ["Earl", "Breakfast"]
[7] pry(main)> cats
=> {"Devon"=>["Earl", "Breakfast"]}

[7] pry(main)> cats = Hash.new([])
=> {}
[8] pry(main)> cats["John"] << "Kiki"
=> ["Kiki"]
[9] pry(main)> cats
=> {}
[10] pry(main)> cats["Raul"]
=> ["Kiki"]
```
- in the bottom half, we see that adding kiki to john causes 'raul' to have kiki in its values as well.
- also on line 8, we push kiki into john's value, but we never set a value for john, so it is never stored in the hash.
- to fix this we do the same thing as with arrays.
```ruby
[11] pry(main)> cats2 = Hash.new() { [] }
=> {}
[12] pry(main)> cats2["Devon"] << "Breakfast"
=> ["Breakfast"]
[13] pry(main)> cats2["George"]
=> []
```
- we pass a block to the Hash.new method that is called for every new key
- still same situation where it doesnt get saved though
- to fix this, we have to modify the block

```ruby
[17] pry(main)> cats3 = Hash.new { |h, k| h[k] = [] }
=> {}
[18] pry(main)> cats3["Devon"]
=> []
[19] pry(main)> cats3
=> {"Devon"=>[]}
[20] pry(main)> cats3["John"] << "Kiki"
=> ["Kiki"]
[21] pry(main)> cats3
=> {"Devon"=>[], "John"=>["Kiki"]}
```
- here, for every key the hash will set the value of the key to be a new [] value.
- an issue can be see on line 18 and 19 where checking for the devon key actually adds the key. 
- 