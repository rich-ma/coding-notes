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
- 