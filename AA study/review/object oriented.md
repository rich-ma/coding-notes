# Ojbect Oriented Programming
- **OOP** is a design pattern used to build applications
- goal is to create programs using objects that interact with each other.
  

## Abstraction and Encapsulation
- **Abstraction**: process of exposing essential functions/features of an object while hiding/protecting inner details that aren't necessary to using the feature. (i.e. the ability to change the name/owner of a cat, but not the breed,sex,parents,etc)
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
