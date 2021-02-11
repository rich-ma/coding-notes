# Monkey patching Classes
- Adding additional methods to existing classes
- Ruby types(String, Integer, Array, Hash, etc) are actually just classes


```ruby
"hello".upcase? #false
"HELLO".upcase? #true

class String

	def upcase?
		self == self.upcase
	end

end
```
- here we write a new method to the String class to check if a string is already upcased
- adding functionality to existing classes
- can still use other methods


