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
      word = word.gsub(/[aeiuo]/, '')
    end
    word
  end.join(' ')
end
```
- we use the gsub method and regex to remove lowercase vowels to remove vowels here.
- use enumerable map and join the resulting array
- take advantage of ruby's default return as well.

```ruby


```

```ruby


```

```ruby


```


