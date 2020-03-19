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