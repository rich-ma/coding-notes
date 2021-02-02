# Procs
 - Procs are objects that contain blocks in them
 - allow us to save blocks to variables to use them in our code more efficiently.


## creating a proc
- We cannot pass a block into a code, but we can pass procs.
- A proc is a sort of wrapper around a bloc.

```ruby
doubler = Proc.new { |num| num * 2 }
p doubler # #<Proc:0x00007f9a8b36b0c8>
```
- in this code we create a new prop called doubler that takes the parameter num and multiplies it by 2
- we create a new proc, and give it the block to wrap
- since the proc is just a regular object, we can assign it to a variable, in this case doubler


## Calling a proc
- to call a proc you use it with Proc#call method

```ruby
doubler = Proc.new { |num| num * 2 }
p doubler.call(2) #=> 4
p doubler.call(12) #=> 24
```
- we can pass in any arguments the block expects, like a standard method


## passing a proc to a method
```ruby
def add_and_proc(num_1, num_2, prc)
  sum = num_1 + num_2
  p prc.call(sum)
end
```
- in the method above, we pass 3 arguments, two nums to be added, and a proc.

```ruby
def add_and_proc(num_1, num_2, prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # => 10

square = Proc.new { |num| num * num }
add_and_proc(3, 6, square)    # => 81

negate = Proc.new { |num| -1 * num }
add_and_proc(3, 6, negate)    # => -9
```

- we can make the proc anything, first example we double the sum, square it the second, and multiply by -1 the last.
- this lets us apply versatility to methods.
- only caveat is that we have to wrap each block in a proc, which can help organize code, but makes it less flexible.

```ruby
# Version 1: manual, proc accepting method
def add_and_proc(num_1, num_2, prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # => 10


# Version 2: automatic conversion from block to proc
def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

add_and_proc(1, 4) { |num| num * 2 }  # => 10
```
- here, we are able to use the & operator which ruby automatically converts into a proc for us. 
- in the first version, we initialize the doulber variable to a new proc and give it a block.
- in the second version we give the method a &prc parameter which accepts a block and automatically converts it into a proc object for us.
- if you see, you don't actually pass three arugments to the method, but you give a block at the end, which ruby is expecting due to the & operator
- you also can't pass a proc as an argument anymore since it is expecting a block
```ruby
def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # ArgumentError: wrong number of arguments (given 3, expected 2)
```
- if a method expects an argument to be a proc (prc) vs a block(&prc) you will have to give the respective case


## using &
- & can be used to turn a block into a proc, but it can also turn a proc back into a block

```ruby
def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # Error
```
- here we see that giving a proc when a block is expected invokes an error
- in the next situation we use the & operator again to turn it back into a block like &doubler

```ruby
def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, &doubler)   # => 10
```
- so & can turn a block into a proc, or a proc into a block
