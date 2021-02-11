# Input/Output

## Requiring files
- As our code gets larger and larger, we need to start separating code into respective files to organize and maintain

## Pet Hotel Example
- 

```ruby
# pet_hotel.rb

class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

class Cat
  def initialize(name)
    @name = name
  end
end

hotel = PetHotel.new("Animal Inn")

cat_1 = Cat.new("Sennacy")
cat_2 = Cat.new("Whiskers")

hotel.check_in(cat_1)
hotel.check_in(cat_2)

p hotel
# <PetHotel:0x007fb1ce1e91f0
#   @name="Animal Inn",
#   @guests=[
#     #<Cat:0x007fb1ce1e9060 @name="Sennacy">,
#     #<Cat:0x007fb1ce1e8f48 @name="Whiskers">
#   ]
# >
```

- Since these two classes are fairly small, it looks ok to have both on one file, but as they grow and get more complex, we need to separate them
- this gets compounded when we add more animal classes
- **Separation of concerns*: One file should focus on implementing one class
- Each class and file should be able to stand on their own without interaction from other classes
  
## Better hotel design
```
project_root
  ├── pet_hotel.rb
  ├── cat.rb
  └── other_animals
			└── dog.rb
```
- here is a better design for our project with a root folder and organization
- to connect these files we have to **import** them into the respective files that they are needed.


## Require Relative
```ruby
# project_root/cat.rb
class Cat
  def initialize(name)
    @name = name
  end
end

```

```ruby
# project_root/other_animals/dog.rb
class Dog
  def initialize(name)
    @name = name
  end
end
```

```ruby
# project_root/pet_hotel.rb

# Let's require the last two files, by specifying their path's relative to this pet_hotel.rb file
require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"

class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

hotel = PetHotel.new("Animal Inn")

cat = Cat.new("Sennacy")
dog = Dog.new("Fido")

hotel.check_in(cat)
hotel.check_in(dog)

p hotel
# <PetHotel:0x007ffe7f01af60
#   @name="Animal Inn",
#   @guests=[
#     #<Cat:0x007ffe7f01aee8 @name="Sennacy">,
#     #<Dog:0x007ffe7f01ae98 @name="Fido">
#   ]
# >
```
- to run our hotel project we just need to run the pet_hotel.rb file since it imports/requires both the cat and dog.rb files
- **require relative** is a method we use to specify a path to another ruby file(relative to the current file)
- we have access to Constants between files, but not regular variables.
- to make a constant you just name the variable with a capital first letter, vs const delcaration in other languages


## require vs require relative
- we use require when we use **RSPEC**, **bundle exec rspec** automatically knows to loo inside of /lib folder
- use **require** when gems are involved

# User Input

## getting inputs
- to get input from users we use the method **gets**
- this will halt execution of the code and allow the user to type characters until they press enter on their keyboard
- once enter is pressed, the gets method will return a string containg the users keystrokes

```ruby
p "Enter your name:"
name = gets
p "hello " + name
```
- the code above will ask the user for their name, and then print "hello _____"

## Dealing with new lines
- when we use gets, new lines will show up as \n in the string that gets returned
- we need to be aware of this when using gets

```ruby
puts "Enter 'yes' or 'no'"

response = gets

if response == "yes"
  puts "yup!"
elsif response == "no"
  puts "nah!"
else
  puts "I'm sorry, my responses are limited."
end
```
- this code would not work because the captured string from get would be either yes\n or no\n which would not properly captured in the if statements
  
## chomping new lines
- to fix this issue we can use chomp to remove the new line(\n) from each response
```ruby
my_string = "yes\n"
p my_string       # "yes\n"

p my_string.chomp # "yes"
```
- chomp removes all newline chars.

## getting numbers
- another common issue is getting numbers since gets only returns strings, we have to convert string to int, to_i.

```ruby
numeric_string = "42"
p numeric_string      # "42"
p numeric_string.to_i # 42
```

