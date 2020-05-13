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
