```ruby
def count_e(word)
  count = 0;
  word.eachwithindex
end


def count_a(word)
  count = 0
	word.each_char do |ch|
      count += 1 if (ch == 'a' || ch == 'A')
    end
	return count
end
//go through each char, check for capitalized and lowercase

def count_vowels(word)
  vowels = 'aeiou'
  count = 0
  
  word.each_char {|ch| count +=1 if vowels.index(ch)}
  
  return count
end
//create a vowel string, would have been better to create an object


def sum_nums(max)
  count = 0
  (1..max).sum()
end
// use a range in ruby to general an array from 1..max
// using two dots is inclusive of the last, three is exclusive

def factorial(num)
	(1..num).reduce(:*)
end
//uses another range, this time and reduce and pass in the :* to find the factorial.  

def reverse(word)
	result = ''
  	word.each_char {|ch| result = ch + result}
  return result
end
//we use the enumerable each_char here and unshift each character into result, which is rearranging them in reverse order.

def is_palindrome(word)
  i = 0
  j = word.length - 1
  
  until(i > j || i == j)
    if word[i] != word[j]
      return false 
    end
    i += 1
    j -= 1
  end
  
  return true
end
//start indices at the start and end of the word, progress one closer each loop until we find one not equal, or the indices are equal or switch places.
// this tell us it is true
```
