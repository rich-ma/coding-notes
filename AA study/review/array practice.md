Doubler
Write a method doubler(numbers) that takes an array of numbers and returns a new array
where every element of the original array is multiplied by 2.

```ruby
def doubler(numbers)
	result = []
  numbers.each {|num| result.push(num * 2)}
  result
end
```
Yell
Write a method yell(words) that takes in an array of words and returns a
new array where every word from the original array has an exclamation point after it.
```ruby
def yell(words)
	words.map {|word| word + '!'}
end
```
Element Times Index
Write a method element_times_index(nums) that takes in an array of numbers and returns a new array containing every number of the original array multiplied with its index.
```ruby
def element_times_index(numbers)
  results = []
	numbers.each_with_index {|num, i| results << num * i}
  results
end

def element_times_index(numbers)
	numbers.each_with_index.map {|num, i| num * i}
end
```
// could have also done each_with_index.map


Even Nums
Write a method even_nums(max) that takes in a number max and returns an array containing all even numbers from 0 to max
```ruby
def even_nums(max)
	results = []
  i = 0
  until i >= max
    results << i
    i += 2
  end
  
  results
end

```
First Half
Write a method first_half(array) that takes in an array and returns a new array containing the first half of the elements in the array. If there is an odd number of elements, return the first half including the middle element.
```ruby
def first_half(array)
 middle = (array.length/2.0).ceil()
  [0...middle].map {|i| array[i]}
end
```
- could do middle = ... - 1
- and then do [0..middle] to exclude it as well.  Either way works


Select Odds
Write a method select_odds(numbers) that takes in an array of numbers and returns a new array containing the odd numbers of the original array.
```ruby
def select_odds(numbers)
	numbers.select {|num| num % 2 == 1}
end
```
- use select instead of select! to not modify original, and to return new array
- use mod2 to grab odds

Fizz Buzz
Write a method fizz_buzz(max) that takes in a number max and returns an array containing all numbers greater than 0 and less than max that are divisible by either 4 or 6, but not both.
```ruby
def fizz_buzz(max)
  i = 2
  results = []
  
  while i < max
    if i % 4 == 0 && i % 6 == 0
    elsif i % 4 == 0 || i % 6 == 0
      results << i
    else
    end
    i += 2
  end
  results
end


```

```ruby


```

```ruby


```

