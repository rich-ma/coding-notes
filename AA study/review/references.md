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


# Scope
- **Scope**: the context in which a variable name is valid and can be used
- ruby has a few types of variables: Local, Instance, class
- **local variables** can be declared anytime you write something like:
  - some_var = 'some_val'
- **instance varialbes** begin with @
- **class variables** begin with @@


## Block scoping
- variables declared within a block are not accessible once we exit the block
- if a variable is declared outside of a block, we have access within a block, and any changes made to it within the block persist as well.
- **Local variables declared in an outer scope are available and can be modified by all inner scopes.  Local variables declared in inner scopes are not accessible to outer scopes**
- if/while statements do not work the same way as blocks.  local variables declared within an if/while statement are accessible, given that the conditions were met


## scope gates
- scope gate is when we lose access to variables defined outside as we enter a new context like a method or class.
```ruby
x = 2
​
def display_x
  puts x
end
​
display_x # Error - undefined local variable `x`
```
- even though x is defined before the method in an 'outer' scope, the method defintion, **def**, opens a new **scope gate** and we lose access to all previously defined **local** variables.  we only have access to local variables defined within the method, and parameters.

```ruby
x = 2
​
def display_x(x)
  puts x
end
​
display_x(x) # outputs 2
```



```ruby

self # => main

class Hello
  p self # => Hello
end
```
- here we can see how the self changes as we move into the class
- the exception to this are **GLOBAL VARIABLES** which are deonted with the $ sign.  These are accessible in every scope, but are dangerous and typically unecesary.

## HAsh and Equals
- **==**: fundamental check for equality, checks if two objects have the same value
- == is inherited from the Object class. it will return true only if the two objects are literally the same object(pointer equality).  
  - this means that even if two arrays have the same exact values, it will not be equal since they point to different objects in memory.

- **eql?**: assesses general equality. uses an objects **#hash** method to assess equality. that way **a.eql? b** becomes a.hash == b.hash
  - to create a meaning eql? method for a class, you must overwrite the **#hash** method
  - one example of meaningful is eql? vs ==, where == will do a type conversion for numericals(int to float/etc) but eql? does not.
  ```ruby
	   3.0 == 3 #=> true
   3.0.eql? 3 #=> false
	 ```
	- this is because float#hash, and int#hash are not the same
```ruby
	some_hash = { 3 => 'the third' }
	some_hash[3.0] #=> nil
	some_hash[3] #=> 'the third'
```

## #equal? (Identity Equality)
- **equal?**: does simple pointer comparison, same behavior as default **==** for Object class.
```ruby
class Dog
   # ...
end

a = Dog.new
b = Dog.new
a = c

a.equal? b #=> false
a.equal? c #=> true
```
- should never overwrite **#equal?**

## === (Case equality)
- **#===**: same behavior as #== for most classes, and by default classes you write, this is the method that **case** uses to determine which block to execute
```ruby
case a
when b
   # ...
when c
   # ...
else
   # ...
end
```
is equivalent to 
```ruby
if b === a # triple equals!
   # ...
elsif c === a
   # ...
else
   # ...
end
```
- #=== should be rewritten in classes if you want to add advanced case/when behavior
- example: **Integer#===** checks to see if the argument is a type of integer
```ruby
case number
when Integer
   # ...
when Float
   # ...
end
```
- here, we can have different interactions based on numeric type
- You can use it for pretty crazy situations such as Regexp#=== 
```ruby
tracking_service = case number
   when /^.Z/ then :ups
   when /^Q/ then :dhl
   when /^96.{20}$/ then :fedex
   when /^[HK].{10}$/ then :ups
end
```
- from http://stackoverflow.com/a/1735777


## Equality and Hash keys
- to use instances of a class as Hash keys, you need to know how Hash uses the #eql? method
- when a hash looks of a key, it first looks for an existing key object whose hash method returns a value equal to that returned by the given key's hash method
- then it checks if **found_key_object.eql?(given_key_object), verifying that in addition to having the same hash, the found key and given key should be equal
- if both if these tests pass, then you will get the desired value instead of nil.
```ruby
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def hash
    @name.hash
  end
end
```
- here is an example, where we have a Cat class with a name and we use the hash of the string name as our cat hash value.
```ruby
hash = {}
cat1 = Cat.new('Fluffy')
hash[cat1] = 'is the best cat'
```
- if we create another Cat with the same name and lookup the value of the first isntance, the hash will not be able to find it.
- this is a problem as we want 2 cats wiht the same data(name) to be treated as the same key by the hash.
```ruby
hash[cat1] #=> 'is the best cat'
cat2 = Cat.new('Fluffy')
hash[cat2] #=> nil
```
- this happens because the class inherits the default **aql?** method from **Object** which only looks for pointer equality.
```ruby
class Cat
  def eql?(other)
    self.name == other.name
  end
end

hash[cat2] #=> 'is the best cat'
```
- takeaway: if you create a class and want to use it as a key in a hash, you need to define **#hash** and **#eql?**