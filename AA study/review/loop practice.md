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

```
