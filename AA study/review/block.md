# Blocks

## Block basics

- One of the main features of ruby as a language.  We have been using blocks with enumerables(each, map, times, etc)
- block is a chunk of code that gets passed into a method to be executed
- Two ways to pass a block into a method:
	1. {...}: brace syntax for blocks with a single line of code
   ```ruby
	 [1,2,3].map { |num| -(num * 2) } # => [-2, -4, -6]
	 ```
	2. do ... end syntax for multiple lines
	```ruby
	[1,2,3].map do |num|
  doubled = num * 2
  -doubled
end     # => [-2, -4, -6]
	```

- blocks can accept parameters as well(| param_1, param_2, etc|)
- blocks are similar to methods, both contain lines of codes that can be executed, and take parameters.
- big difference is that methods can **return**, while blocks cannot

```ruby
# Correct:
def double_eles(arr)
  arr.map do |ele|
    ele * 2
  end
end
double_eles([1,2,3]) #=> [2,4,6]


# Incorrect:
def double_eles(arr)
  arr.map do |ele|
    return ele * 2
  end
end
double_eles([1,2,3]) #=> 2

```

- looking at the incorrect version, you see that using the **return** keyword immediately forces the outer method, double_eles, to evaluate to the first iteration from the map.
- this is why its important to keep blocks and methods as separate distinct concepts.

## using methods as blocks
- its common for a block to be able to take an argument and call methods
```ruby
["a", "b", "c"].map { |str| str.upcase }  #=> ["A", "B", "C"]
[1, 2, 5].select { |num| num.odd? }       #=> [1, 5]
```
- here the block passed into the map enumerable uses the string method upcase to return a new array of upcase'd characters
- in the second one the number method odd? is called to select the odd integers in the array.
- We can actually clean this up thanks to some ruby syntax
```ruby
["a", "b", "c"].map(&:upcase) #=> ["A", "B", "C"]
[1, 2, 5].select(&:odd?)      #=> [1, 5]
```
- using the **&** operator allows us convert the method into an object that is passed into the enumerable.
- can't directly pass a method into another method, so we use the & operator
- Anytime you are writing a block that simple contains a call to a method, you can use the & operator
```ruby
array.map { |block_param| block_param.method }

array.map(&:method)
```
- the method must be compatible with the data, so you have to know what datatypes are in your array or data structure.

