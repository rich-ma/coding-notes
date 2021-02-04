# Classes
- Classes allow us to create objects of the same structure without repeating ourselves(DRY, Don't Repeat Yourself).
- this allows us to create objects that share similar attributes like a cat(color, name, age, sex, etc)
- we could use a hash, or array, or other structures to store them, but it would take a long time to create and fill in each one, which classes and constructors can do most of it for us.

# creating a cat class
- To create a class, you need a few things:
  - need to use the **class** keyword
  - name of the class must be uppercase
  - we can define methods in the class, one being the initializer(constructor)
- **initialize** is a special method that constructs a new object in the class for us

```ruby
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end
end
```
- in this example, the contructor expects 3 arguments for the 3 attributes(name, color, age)
- the @ symbol is how we denote an instance variable, or attribute of our class


## initializing a new cat
```ruby
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
cat_2 = Cat.new("Whiskers", "white", 5)
p cat_1 #<Cat:0x007fb6d804cfe0 @age=3, @color="brown", @name="Sennacy">
p cat_2 #<Cat:0x007fb6d6bb60b8 @age=5, @color="white", @name="Whiskers">
```
- by using the Cat.new method on a class we are able to initialize a new object of that class
  - this calls on the **initialize** constructor method in our class
- it expects us to give the three arguments for the attributes for the cat isntance as well, age, color, name.


## getter methods
- getter methods are methods that retrieve some attribute from an instance of a class.  I.E. color, name, age of a cat.

```ruby
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def get_name
    @name
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1.get_name # "Sennacy"
```
- here we write a get_name method, the **@** indicates instance variables/attributes like mentioned earlier
- must call this method on an instance of a cat, like cat_1, can't just call Cat.get_name since that is a class
- instead of get_name, its typical to treat them as attributes instead of a method like **name**, so cat_1.name would be a getter

```ruby
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def name
    @name
  end

  def age
    @age
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1.name  # "Sennacy"
p cat_1.age   # 3

cat_2 = Cat.new("Whiskers", "white", 5)
p cat_2.name  # "Whiskers"
p cat_2.age   # 5

p cat_2.color # This will give NoMethodError: undefined method `color'
```
- without writing the appropriate getter method, it won't work, like color above.


## setter methods
- getters get attributes of an instance, setters change attributes
```ruby
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  # getter
  def age
    @age
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
cat_1.age = 42  # NoMethodError: undefined method `age='
```
- we can't just try to assign(=) cat_1s age to 42, without the proper setter method
- to do this we have to write a setter method
```ruby
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  # getter
  def age
    @age
  end

  # setter
  def age=(number)
    @age = number
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1 #<Cat:0x007f8511a6f340 @age=3, @color="brown", @name="Sennacy">
cat_1.age = 42
p cat_1 #<Cat:0x007f8511a6f340 @age=42, @color="brown", @name="Sennacy">
```
- the def age=(num), allows us to assign the age of the cat instance. 

