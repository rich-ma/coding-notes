# RSPEC
------
## Test and Test Driven Development(TDD)

- TDD(Test driven development): strategy to develop a program where the requirements are turned into tests and developed until all test cases are passed.
- common TDD workflow for a method
  1. write a new test
  2. run all tests and check for fail
		- if a test passes without anything being written, should be rewritten/evaluated
	3. make changes to the method to satisfy the tests
	4. run all tests and check for pass
  	- go back to step 3 if any tests fail
   	- if all tests pass, but more coverage/edge cases are needed, go back to step 1
- once all 4 steps are complete, 1 iteration of TDD is complete

### TDD example workflow with 'prime?'


> Write a method `prime?(n)` that takes in a number and returns a
boolean indicating whether or not the number is a prime.
A prime number is a number only divisible by two numbers, 1 and itself.

- TDD requires us to write code methodically and test thoroughly.
- one iteration would require us to add one 'feature' at a time to our method
- we continue our iterations of TDD until the method passes all scenarios required.
- start by writing the an empty method
```ruby
def prime?(num)

end
```
- this should fail well written test case
  
## iteration 1:

### Write new tests
```ruby
# TDD Iteration 1: return false if the number is not prime

# new test
prime?(6) # => false
prime?(8) # => false
prime?(9) # => false
```
- code should return false if the numbers are not prime. We give the test simple non prime arguments.

### Run all tests and check for new failures
- We then run the code to verify that the tests are good and fail
  - cannot just assume that the tests will fail, sometimes tests pass due to poor writing or unforseen circumstances. 
```ruby
# TDD Iteration 1: return false if the number is not prime

def prime?(num)

end

# desired output
prime?(6) # => false
prime?(8) # => false
prime?(9) # => false

# current output
prime?(6) # => nil (FAIL)
prime?(8) # => nil (FAIL)
prime?(9) # => nil (FAIL)
```
- now we see that the tests all fail, this is great since now we can code to fix this problem
- 

### Make changes to the method/code

- now that we know the tests are failing, we change the code to pass the tests
- Don't add extra functionality, only to satisfy the tests
- minimal logic
- at this point we just need basic code to test if standard positive non zero values are prime or not

```ruby
# TDD Iteration 1: return false if the number is not prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
end
```

### Run all tests
- We should all run test at this point, even previously written ones to see if we broke any of the tests/code
  - if we broke anything, we should go back to the previous step and debug
```ruby
# desired output
prime?(6) # => false
prime?(8) # => false
prime?(9) # => false

# current output
prime?(6) # => false (PASS)
prime?(8) # => false (PASS)
prime?(9) # => false (PASS)
```
- now we see that all our of tests are passing
- we can add more tests for complete coverage and edge cases

### Iteration 2, new tests
- now, can our code handle proper prime numbers?
```ruby
# desired output
prime?(6) # => false
prime?(8) # => false
prime?(9) # => false

# current output
prime?(6) # => false (PASS)
prime?(8) # => false (PASS)
prime?(9) # => false (PASS)
```

### Iteration 2, run all tests and check for new failures
```ruby
# TDD Iteration 2: return true if the number is prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
end

# desired output
prime?(2)   # => true
prime?(7)   # => true
prime?(11)  # => true

# current output
prime?(2)   # => 2...2 (FAIL)
prime?(7)   # => 2...7 (FAIL)
prime?(11)  # => 2...11 (FAIL)
```
### Iteration 2, make changes to the method
```ruby
# TDD Iteration 2: return true if the number is prime

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end
```
- just return true at the end of the non prime check.

### iteration 2, run all tests and check for pass
```ruby
# current output
prime?(6) # => false (PASS)
prime?(8) # => false (PASS)
prime?(9) # => false (PASS)
prime?(2)   # => true (PASS)
prime?(7)   # => true (PASS)
prime?(11)  # => true (PASS)
```
- now all of our tests so far are passing, go onto third iteration for more tests or edge cases

### Iteration 3, write a new test
- now we need more coverage for edge cases, -, negatives, 1, etc.

```ruby
# TDD Iteration 3: return false if the number is less than 2, since 2 is the smallest prime

prime?(1)   # => false
prime?(0)   # => false
prime?(-42) # => false
```

### iteration 3, run tests check for failures
```ruby

# desired output
prime?(1)   # => false
prime?(0)   # => false
prime?(-42) # => false

# current output
prime?(1)   # => true (FAIL)
prime?(0)   # => true (FAIL)
prime?(-42) # => true (FAIL)
```

### iteration 3, make changes to code
```ruby
def prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end
```

### iter 3, run code and check for pass
```ruby
# desired output
prime?(1)   # => false
prime?(0)   # => false
prime?(-42) # => false

# current output
prime?(1)   # => false
prime?(0)   # => false
prime?(-42) # => false
```
- need to make sure you're running all the tests, not just the ones you just wrote to make sure you didn't break anything


## When to use TDD
- Popular development strategy in the professional world
- methodical process that can be tedious
- don't need to follow it throughout your career, but keep it in mind
- 

