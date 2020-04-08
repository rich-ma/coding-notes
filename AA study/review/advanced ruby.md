# Advanced Ruby Notes

## Ruby Syntax and Style: Become a Rubyist
- ruby has stnactical and stylistic features that are 'shortcuts' that many programmers find uncomfortable to read and write
  
### implicit returns
- automatically return the evaluation of the last executed expression
- to return early, still need to use 'return'
``` ruby 
# Less preferred
def get_avg(num_1, num_2)
    return (num_1 + num_2) / 2
end

# Preferred by a Rubyist
def get_avg(num_1, num_2)
    (num_1 + num_2) / 2
end
```

### Omitting parentheses for method calls
- can drop parentheses on method calls if there are no arguments to pass in
``` ruby
	def say_hi
    puts "hi"
end

# Less preferred 
say_hi()

# Preferred by a Rubyist
say_hi
```

### use single line conditionals when possible
- turn simple if statements to one liners
```ruby
raining = true

# Less preferred
if raining
    puts "don't forget an umbrella!"
end

# Preferred by a Rubyist
puts "don't forget an umbrella!" if raining
```

### Use built-in methods
- lots of syntactic sugar we can use

``` ruby 
a = [1,2,3,4,5]

// instead of a[a.length-1] for last

a[-1]
a.last

```

### Enumerables
- enumerables in Ruby are powerful, take advantage of them to iterate
- helps with readability and removes unecessary errors
```ruby
def repeat_hi_times(num)
	i = 0
	while i < num
		puts 'hi'
		i += 1
	end
end

//compared to

def repeat_hi_times(num)
  num.times { puts 'hi' }
end
```
- some can even solve algorithms on their own(even?, select, all, etc)

```ruby 
# Less preferred
def all_numbers_even?(nums)
    nums.each do |num|
        return false if num % 2 != 0
    end

    true
end

# Preferred by a Rubyist
def all_numbers_even?(nums)
    nums.all? { |num| num.even? }
end
```

### Common Enumerables

- all?
- any?
- none?
- one?
- count

```ruby
p [1, 2, 3, 4, 5, 6].count { |el| el.even? }    # => 3
p [1, 3, 5].count { |el| el.even? }             # => 0
```

-sum
```ruby
p [1, -3, 5].sum   # => 3
```

- max and min
```ruby
p [1, -3, 5].min    # => -3
p [1, -3, 5].max    # => 5
p [].max            # => nil
```

-flatten
```ruby 
multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]

p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]
```

## Symbol Notes
- a data type in ruby similar to Strings.
- symbols are denoted with ':' a colon before the caracters
  - don't need to wrap in quotes like a string :symbol, vs 'string'

```ruby
str = "hello"   # the string 
sym = :hello    # the symbol

p str.length    # => 5
p sym.length    # => 5

p str[1]        # => "e"
p sym[1]        # => "e"

p str == sym    # => false
# a string is different from a symbol!
```
- can do length, access like an array, but is not a string

### immutable symbols
- symbols cannot be changed, they are immutable, unlike a string

```ruby
str = "hello"
sym = :hello

str[0] = "x"
sym[0] = "x"

p str   # => "xello"
p sym   # => :hello
```
- this is powerful in that we don't need to worry about a symbol being changed, and only make it once, like const in JS
- behind the scenes, when you create or reference a string, ruby will allocate memory in our machines memory to store the string, even if its a duplicate value.
- symbols do not need to be recreated since they are immutable so we don't need to track the changes.
- here is an example of ruby memory storing new String literals in different memory spaces, and symbols in the same

```ruby 
"hello".object_id   # => 70233443667980
"hello".object_id   # => 70233443606440
"hello".object_id   # => 70233443438700

//vs

:hello.object_id    # => 2899228
:hello.object_id    # => 2899228
:hello.object_id    # => 2899228
```
- if you are not planning on changing the string, a symbol can be used instead.

### symbols as hash keys
- using symbols in as a key in a hash object is very popular
```ruby 
my_bootcamp = { :name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red
```
- in ruby we can use some syntactic sugar to save time by removing the rocket(=>) and just moving the colon between the key and value

```ruby 
my_bootcamp = { name:"App Academy", color:"red", locations:["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red
```
- saves us some time, and is only allowed when initializing the symbols in the hash.
- still need to use the colon when accessing the hash object(hash[:key])

## Default Arugments and Option Hashes

### Default Arguments
- like other languages, you can declare a default value for parameters

```ruby 
# Let's make num an optional parameter.
# By default, num will have the value of 1
def repeat(message, num=1)
    message * num
end

p repeat("hi") # => "hi"
p repeat("hi", 3) # => "hihihi"
```
- in this, the number of repeats is optional, with a default of 1.
  

### option hash
- if your method accepts a hash as an argument, you can omit the braces
```ruby
def method(hash)
    p hash  # {"location"=>"SF", "color"=>"red", "size"=>100}
end

method({"location"=>"SF", "color"=>"red", "size"=>100})

# this also works:
method("location"=>"SF", "color"=>"red", "size"=>100)
```
- helps with readability
```ruby
def modify_string(str, options)
    str.upcase! if options["upper"]
    p str * options["repeats"]
end

# less readable
modify_string("bye", {"upper"=>true, "repeats"=>3}) # => "BYEBYEBYE"

# more readable
modify_string("bye", "upper"=>true, "repeats"=>3)   # => "BYEBYEBYE"
```
-combine both together
```ruby 
def modify_string(str, options={"upper"=>false, "repeats"=>1})
    str.upcase! if options["upper"]
    p str * options["repeats"]
end

modify_string("bye")   # => "bye"
modify_string("bye", "upper"=>true, "repeats"=>3)   # => "BYEBYEBYE"
```

## Splat Operator(*)

### Using splat to accept additional arguments
- ruby methods are strict with how many arguments we pass it
- if you don't give the exact arguments(without defaults), you will get an argumentError

```ruby
def method(arg_1, arg_2)
    p arg_1
    p arg_2
end

method("a", "b", "c", "d", "e") # ArgumentError: wrong number of arguments (given 5, expected 2)
```

- to allow a method to have the ability to accept at least 2 arguments and potentially more, we use a splat parameter
- this will allow the rest of the arguments to be collected into an array.
- 
```ruby
def method(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # ["c", "d", "e"]
end

method("a", "b", "c", "d", "e") 
```

- this is an optional argument that can be empty

```ruby
def method(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # []
end

method("a", "b") 
```
- here shows that *other_args is nothing so nothing gets printed.
- splat should always be put at the end of a parameter list to avoid confusion

### Using splat to decompose an array
- splat can be used to decompose or unpack elements in an array as well
- if we want a method to split up an array for us, splat is a good way

```ruby
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["grace", "hopper"]
greet(names)    # ArgumentError: wrong number of arguments (given 1, expected 2)
```
- this code doesnt work because we passed in an array instead of two arguments like it was expecting
- changing the argument to a splat array will fix this
```ruby
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["Grace", "Hopper"]
greet(*names)    # => "Hey Grace, your last name is Hopper"
```

- the splat essentially removes the [] from the array, leaving just the elements like a comma separated list
- allows for more creative uses

```ruby
arr_1 = ["a", "b"]
arr_2 = ["d", "e"]
arr_3 = [ *arr_1, "c", *arr_2 ]
p arr_3 # => ["a", "b", "c", "d", "e"]
```
- here we use splat to decompose two arrays to join into a different array

### Using splat to decompose a hash
- can use double splat (**) to unpack a hash's key value pairs
- will only work when the keys of the hash are symbols

```ruby
old_hash = { a: 1, b: 2 }
new_hash = { **old_hash, c: 3 }
p new_hash # => {:a=>1, :b=>2, :c=>3}
```

## Inject
- Inject is a very versatile method for problem solving
- it allows us to iterate through an array and pass in a block
- it is the same as reduce from other languages


### Inject with only a block
- most straightforward way to use inject is to call it on an array and pass in a block, like a regular enumerable.
- the block accepts two params:
  - accumulator
  - current element
- block returns what new accumulator will be after a single iteartion
```ruby
[11, 7, 2, 4].inject { |acc, el| acc + el }
```
- by default, the accumulator sets as the first element in the array(11)
- because of this, the first element it looks at is actually 7
- once done, the final accumulator will be returned, 24

- we can use this to our advantage, and do interesting things, such as finding the lowest or highest value in an array
```ruby
p [11, 7, 2, 4].inject do |acc, el|
    if el < acc
        el
    else
        acc
    end
end # => 2
```
- here the accumulator is replaced if the element is less than the accumulator, essentially finding the lowest
- accumulator is reasigned to wahtever is the result in each iteration


### inject with a default accumulator

- inject also takes a starting accumulator as an argument

```ruby
# FIRST ITERATION:
# acc = 100
# el = 11
# new_acc = 111
[11, 7, 2, 4].inject(100) { |acc, el| acc + el }
```

```ruby
# SECOND ITERATION
# acc = 111
# el = 7
# new_acc = 118
[11, 7, 2, 4].inject(100) { |acc, el| acc + el }
```
```ruby
# THIRD ITERATION
# acc = 118
# el = 2
# new_acc = 120
[11, 7, 2, 4].inject(100) { |acc, el| acc + el }
```
```ruby
# FOURTH ITERATION
# acc = 120
# el = 4
# new_acc = 124
p [11, 7, 2, 4].inject(100) { |acc, el| acc + el } # => 124
```

- this gives us more flexibility in our usage of inject

```ruby
[11, 7, 2, 4].inject(0) do |acc, el|
    if el.even?
        acc + el
    else
        acc
    end
end # => 6
```