# Recursion

- recursion is when a method calls itself.

```ruby
# recursive method definition:
def say_hello
  p "hello"
  say_hello
end

say_hello # prints "hello" forever
```

Let's step through how this code evaluates. For clarity, we'll be numbering the calls to say_hello. The initial call will be number 0:

- hen we call say_hello for the first time (say_hello_0), we run the code inside the definition as usual. That means we print out "hello" and call say_hello again (say_hello_1). Now we need to evaluate the call to say_hello_1.
- say_hello_1 prints "hello" and calls say_hello_2, now we need to evaluate say_hello_2
- say_hello_2 prints "hello" and calls say_hello_3
- say_hello_3 prints "hello" and calls say_hello_4
- ... and this pattern continues forever!

## Anatomy of a recursive method
- **Base case**: where the recursion is halted by not making a further call(usually an if statement)
- **recursive step**: where the recursion continues by making another call to the method

```ruby
def count_down(num)
    # base case
    if num == 0
        p "Houston, we have lift-off!"
        return;
    end

    p num
    # recursive step
    count_down(num - 1)
end
```
