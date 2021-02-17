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

## Attribute Methods
- instead of writing getters and setters for all of our data attributes, we are able to use **attr_reader**, **attr_writer**, **attr_accessor** that allow us to read, write, and both read/write respectively. 