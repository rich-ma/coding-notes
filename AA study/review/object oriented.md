# Ojbect Oriented Programming
- **OOP** is a design pattern used to build applications
- goal is to create programs using objects that interact with each other.
  

## Abstraction and Encapsulation
- **Abstraction**: process of exposing essential functions/features of an object while hiding/protecting inner details that aren't necessary to using the feature. 
  - an example is a driver understands how to operate a car, but probably not how to fix or build one from scratch.

```ruby
class Course
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end

  def max_students
    @max_students
  end

  def students
    @students
  end
end  

course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)

# Let's to enroll a student
if course.students.length < course.max_students
  course.students << "Alice"
end
```
- in this example, enrolling a student is not protected and relies on the user to attempt to do it themselves
  
```ruby
class Course
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end

  def enroll(student)
    @students << student if @students.length < @max_students
  end
end  

course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)

# Let's to enroll a student
course.enroll("Alice")
```
- in this example, enroll is written neatly into a method that is abstracted.
- abstraction makes code easier to understand and use.


## Encapsulation
- **Encapsulation**: gives users access to things that are safe for them to use, closely relates data attributes and methods to prevent misuse.
  - some examples are passwords, or other things tht we want to keep private or away from the outside for security (i.e. the ability to change the name/owner of a cat, but not the breed,sex,parents,etc)
- in classes, we are unable to change attributes without getters and setters.
- this allows us to protect data and only allow users to affect and access data through methods that we design

```ruby
class Queue
  def initialize
    @line = []
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new

grocery_checkout.add("bob")
grocery_checkout.add("alice")
grocery_checkout.remove          # => "bob"
grocery_checkout.add("noam")
grocery_checkout.add("donald")
grocery_checkout.remove          # => "alice"
grocery_checkout.remove          # => "noam"
grocery_checkout.remove          # => "donald"

# people who are added first to the line will leave first!
```
- by not giving access to the @line data attribute, we protect the integrity of the queue.
- by giving users access to @line, they can change it bowever they want.
```ruby
# this class fails to encapsulate
class Queue
  def initialize
    @line = []
  end

  def line
    @line
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new

grocery_checkout.add("bob")
grocery_checkout.add("alice")
grocery_checkout.line.unshift("noam")   # noam cut the line!
grocery_checkout.remove                 # => "noam"
```
- here a user is able to add a user to the front of the line(noam) whenever they want.

### wrapping up
- abstraction and encapsulation are two pillars of OOP, we will learn more as we continue

# Attribute Methods
- instead of writing getters and setters for all of our data attributes, we are able to use **attr_reader**, **attr_writer**, **attr_accessor** that allow us to read, write, and both read/write respectively. 

- typically we would have to manually write setters and getters

```ruby
class Dog
  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end

  # getters
  def name
    @name
  end

  def age
    @age
  end

  # setters
  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end
end
```

## attr_reader

```ruby
class Dog
  # attr_reader will define #name and #age getters for us
  attr_reader :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end

dog = Dog.new("Fido", 3, "pizza")
dog.name
dog.age
dog.favorite_food # NoMethodError: undefined method `favorite_food', because we didn't pass it to attr_reader
```
- here we can use **attr_reader** to automatically 

```ruby
class MyClass
  attr_reader :attribute_1
  # ...
end
# It would result in this getter method being defined under the hood:

class MyClass
  # ...
  def attribute_1
    @attribute_1
  end
end
```
- attr_reader :name, :age, is actually the same as attr_reader(:name, :age)

## attr_writer


```ruby
class Dog
  # attr_writer will define #name= and #age= setters for us
  attr_writer :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end

dog = Dog.new("Fido", 3, "pizza")

dog.name = "Spot"
dog.age += 1

p dog #<Dog:0x007fd87f1144a0 @age=4, @favorite_food="pizza", @name="Spot">

dog.favorite_food = "calzone" # NoMethodError: undefined method `favorite_food=', because we did't pass it to attr_writer
In other words, when we have this call to attr_writer:

class MyClass
  attr_writer :attribute_1
  # ...
end
It would result in this setter method being defined under the hood:

class MyClass
  # ...
  def attribute_1=(new_val)
    @attribute_1 = new_val
  end
end
```

## attr_accessor
- attr_accessor does both write and read 

```ruby
class Dog
  # attr_accessor will define #name, #name=, #age, #age= methods for us
  attr_accessor :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end

dog = Dog.new("Fido", 3, "pizza")

# Let's use the setter and getter for name!
dog.name = "Spot"
p dog.name          # "Spot"
```
- consider **encapsulation** before using attr_accessor for every attribute.
- 

# Syntactic Sugar
- **synactic sugar** is the broad name for code or syntax that has shortcuts 
  - an example is the attr_reader/writer/accessor from earlier


## implementing 'operator' methods
- we can implement operators like +, ==, > methods in our classes
- in the next example we use the == operator to compare two Person instances based on last name
  
```ruby
class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def ==(other_person)
    self.last_name == other_person.last_name
  end
end

person_1 = Person.new("Jane", "Doe", 20)
person_2 = Person.new("John", "Doe", 18)
person_3 = Person.new("John", "Wayne", 18)

# Calling Person#== without any syntactic sugar is awkward:
p person_1.==(person_2)     # true

# With syntactic sugar, it's much more elegant:
p person_1 == person_2      # true
p person_2 == person_3      # false
```
- the == method here compares the last name of the two peron instances passed to it.
- without syntactic sugar, the regular method call **person_1.==(person_2)**, looks awkward
- since the object calling the method is an instance, self.lastname will refer to person1.lastname, person2 is other_person, since its passed in as an argument.
- synactic sugar lets us drop the . and the () to make it much more readable
- for comparative operators we can assume the left person will be the **self** in the method

## implementing bracket methods
- a custom **#[]** can be used like we do in Arrays and Hashes to access data in the data structures
- say we have a queue and want to create a method to check a position in the queue without exposing the @line attribute
  - we could use the #[] method to do this
```ruby
class Queue
  def initialize
    @line = []
  end

  def [](position)
    @line[position]
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new
grocery_checkout.add("Alan")
grocery_checkout.add("Alonzo")

# Calling Queue#[] without any syntactic sugar is ugly:
grocery_checkout.[](0)          # "Alan"
grocery_checkout.[](1)          # "Alonzo"

# With syntactic sugar, it's waaaaay better:
grocery_checkout[0]             # "Alan"
grocery_checkout[1]             # "Alonzo"
```
- this way our @line is protected and allows users to access the line without risking malintent or potential errors
- when we call the #[] method, there is also syntactic sugar we can use.
  - instead of grocery_checkout.[](1) where we pass in 1 like a parameter, we can use grocery_checkout[1]
  - this will automatically interpret the value as the first argument for the method

## Implementing #[]=
- the next step is to create a method where a user can reassign a value at a specific location in the structure

```ruby
class Queue
  def initialize
    @line = []
  end

  def [](position)
    @line[position]
  end

  def []=(position, ele)
    @line[position] = ele
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new
grocery_checkout.add("Alan")
grocery_checkout.add("Alonzo")

# Let's call Queue#[]= without syntactic sugar:
grocery_checkout.[]=(0, "Grace")
p grocery_checkout    #<Queue:0x007fe7a7a29ec8 @line=["Grace", "Alonzo"]>

# Let's call Queue#[]= again, but with syntactic sugar:
grocery_checkout[1] = "Grace"
p grocery_checkout    #<Queue:0x007fe7a7a29ec8 @line=["Grace", "Grace"]>

```
- again, sytactic sugar lets us write **grocery_checkout[1] = "Grace"** instead of **grocery_checkout.[]=(1, "Grace")**
- the data in the brackets gets taken as the first arugment, and the data after the = will be the second