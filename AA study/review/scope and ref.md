# Scopes and References

## Bubble Sort
- algorithm: sequence of actions to take, usually to solve some problem.
- bubble sort is an aglorithm that 'bubbles' the highest value to the top
  
- Let's see one pass of bubble sort on the array [2, 8, 5, 2, 6]. On each step, the elements currently being scanned are in bold.

- 2, 8, 5, 2, 6 - ordered, so leave them alone
- 2, 8, 5, 2, 6 - not ordered, so swap
- 2, 5, 8, 2, 6 - not ordered, so swap
- 2, 5, 2, 8, 6 - not ordered, so swap
- 2, 5, 2, 6, 8 - our first pass is complete

- in the above example, the 8 is bubbled up to the end of the array, as well as several of the other larger values in the array

## Scope and Reference

### methods and local scope
- lexical scope: how a variable name evaluates in nested code

``` ruby 
def say_hello
    message = "hello"
    p message
end

say_hello
```
- in this code, the variable 'message' only exists within the scope of the method say_hello
- we cannot access it outside of the method
``` ruby 
def say_hello
    message = "hello"
end

say_hello
p message   # NameError: undefined local variable
```
- can't reference a variable that was not defined or accessible in that scope.

```ruby
message = "hi"

def say_hello
    p message   # NameError: undefined local variable
end

say_hello
```
- each method has its own scope
- things defined outside of methods are not globally scoped

### Global Variables
- global variables are accessible in every area of code
- they require special syntax

```ruby
$message = "hello globe"

def say_hello
    p $message
end

say_hello # => "hello globe"
```
- use the $ before the variable name when declaring/intializing
- and $ before the variable name when referencing it

```ruby
def say_hello
    $message = "hello globe"
end

say_hello
p $message # => "hello globe"
```
- here, we create a global variable within the scope of say_hello, but we are still able to access it due to it being globally scoped


### Constants
- Constants are denoted syntatically by beginning a name with a capital letter
- conventionally, the entire name is capitalized like FOOD
  
```ruby
FOOD = "pho"
p FOOD # => "pho"

FOOD = "ramen"  #warning: already initialized constant FOOD
								#warning: previous definition of FOOD was here
```
- cannot reassign a constant
- will recieve a warning
- you cannot reassign a constant, but you can mutate it, so need to be careful

```ruby
FOOD = "pho"
FOOD[0] = "P"
p FOOD # => "Pho
```
- constants are important because they exist in global scope

```ruby
FOOD = "pho"
$drink = "ice coffee"

def my_favorite
    p FOOD
    p $drink
end

my_favorite

```
- this code works because both variables, global and constants exist in the global scope and are accessible(can be referenced) within the my_favorite method
- global scope should be used sparingly, don't want methods to be able to referene data outside of their own scope since they can mutate/manipulate them
  
### What does not have its own scope?
- blocks don't have their own scopes, they are part of the containing method's scope
```ruby
def say_bye
    message = "bye"

    3.times do 
        p message
    end
end

say_bye
```
- conditionals, loops, dont have their own scope
- even though variables can be declared within if statements, they are accessible outside of the statement because if's don't have their own scope. 

```ruby
if true
    drink = "cortado"
end

p drink
```

### Variable lecture notes
- storing information stores it in memory.  When you have a variable and assign it a value, it points to a location in memory that stores its value
- variable name points to a location in memory
- with a second variable that has the same content as the first variable, how does that work?
	- word1 = boot, word2 = boot.
	- both are actually pointing at unique locations in memory
	- we can check the object_id of both variables and see that both are different
	- if we modify the first one, it wont change the second
- in a different situation where we do word21 = 'cat', word2 = word1
  - in this situation, both are referencing the same point in memory
  - if we modify one, it will modify the other
  - can be useful, and also dangerous
- upcase! will mutate the string at the point of memory in place, will not make a new one
- mutations will modify in place, but reassignment will point to a new place in memory
- 

### variable vid 2
- creating arrays with default value can lead to issues
- arr1 = Array.new(3)
  - creates an array lenght 3 with nil as values
- arr = Array.new(10, '?')
  - array lenght 10, with all '?' as the value
- grid = Array.new(3, Array.new(3))
  - if you reassign one of the values its fine, but if we mutate the value, it will mutate all of them
  - variable reference mistake
  - the inner array evaluates to a single array so each array in memory is referencing the same space in memory
- ruby fixes this with a different way to intialize the array with a block
- grid = Array.new(3) { Array.new(3) }
  - a block executes each time, creating a new array with a new point in memory.
  - now modifying one subarray will not affect the rest. 
  - 