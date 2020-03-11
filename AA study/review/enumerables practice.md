To Initials
Write a method to_initials that takes in a person's name string and returns a string representing their initials.

```ruby
def to_initials(name)
  name.split(' ').map {|name| name[0]}.join('')
end

def to_initials(name)
  results = ''
	name.split(' ').map {|name| results << name[0]}
	results
end

```
-- code spaghetti here, could just create a result that you push the answers into and return that.



First In Array
Write a method first_in_array that takes in an array and two elements, the method should return the element that appears earlier in the array.
```ruby
def first_in_array(arr, el1, el2)
  arr.each do |word|
    return word if word == el1 || word == el2    
  end
  
  return false
end
```
- simple algorithms here, very little test cases
- no check for word not existing, or the words being the same 


Abbreviate Sentence
Write a method abbreviate_sentence that takes in a sentence string and returns a new sentence where every word longer than 4 characters has all of it's vowels removed
```ruby
def abbreviate_sentence(sent)
  sent.split(' ').map do |word|
	if word.length > 4
			word = word.gsub(/w+/, &:downcase)
			word[0]
    end
    word
  end.join(' ')
end
```
- we use the gsub method and regex to remove lowercase vowels to remove vowels here.
- use enumerable map and join the resulting array
- take advantage of ruby's default return as well.


Format Name
Write a method format_name that takes in a name string and returns the name properly capitalized.
```ruby
def format_name(str)
 str.split(' ').map do |name|
   name = name.gsub(/\w+/, &:downcase)
   name[0] = name[0].upcase
   name[]
 end.join(' ')
end
```
- use regex again to replace all characters to lowercase, and then change the first one to uppercase
- i could ignore the first one and then change all but the first, but will have to check and modify it at some point


Is Valid Name
Write a method is_valid_name that takes in a string and returns a boolean indicating whether or not it is a valid name.
```ruby
def is_valid_name(str)
  arr = str.split(' ')
  return false if arr.length < 2;
  arr.each do |name|
    return false if name[0] != name[0].upcase
    return false if name[1..-1].match(/[A-Z]/)
  end
    true
end
```
- checking if first letter is not uppercase
- checking all but the first is uppercase
- doesnt check for symbols, numbers, etc


Is Valid Email
Write a method is_valid_email that takes in a string and returns a boolean indicating whether or not it is a valid email address.
```ruby
# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
  arr = str.split('@');
  return false if arr.length != 2
  arr[1] = arr[1].split('.')
  return false if arr[1].length != 2
  return false if arr[0].match(/[A-Z 0-9]/)
  return true
end
```
- interesting one, does not allow numbers in email name

Rotate Array
Write a method rotate_array that takes in an array and a number. The method should return the array after rotating the elements the specified number of times. A single rotation takes the last element of the array and moves it to the front.
```ruby 
def rotate_array(arr, num)
  	num = num % arr.length
  	num.times {|i| arr.unshift(arr.pop())}
  	arr
end
```
- the initial num = num % arr.length is to help reduce the number of unshifts and pops necessary, since it would just cycle every arr.length times

Combinations
Write a method combinations that takes in an array of unique elements, the method should return a 2D array representing all possible combinations of 2 elements of the array.
```ruby 
def combinations(arr)
  results = []
  arr.each_with_index do |el, i|
    j = i + 1
    while j < arr.length
      results << [el, arr[j]]
      j += 1
    end
  end
  
  results
end
```
- this is a big O(n choose 2)



```ruby 

```



```ruby 

```



```ruby 

```



```ruby 

```


