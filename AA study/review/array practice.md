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

```ruby


```

```ruby


```