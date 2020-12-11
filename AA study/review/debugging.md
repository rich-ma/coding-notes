# Pry Notes

## Debugging using Pry

- using a sandbox like pry is useful for testing code.
- lets you get quick feedback.
- Use Ruby **REPL**, Read, Evaluate, Print, Loop
- Can use pry in command line, type code line by line to test ideas.

``` ruby
[1] pry(main)> greens = ["kale", "spinach", "arugula"]
=> ["kale", "spinach", "arugula"]
[2] pry(main)> greens << "broccoli"
=> ["kale", "spinach", "arugula", "broccoli"]
[3] pry(main)> greens.length
=> 4
```

- can also copy and paste code

## ls
- using ls allows us to list methods we can use given a context.
- ls String will show us the following:

```ruby
[1] pry(main)> ls String
String.methods: try_convert
String#methods:
  %            capitalize   delete!                end_with?          ljust         rpartition   strip      tr!                
  *            capitalize!  delete_prefix          eql?               lstrip        rstrip       strip!     tr_s               
  +            casecmp      delete_prefix!         force_encoding     lstrip!       rstrip!      sub        tr_s!              
  +@           casecmp?     delete_suffix          freeze             match         scan         sub!       undump             
  -@           center       delete_suffix!         getbyte            match?        scrub        succ       unicode_normalize  
  <<           chars        downcase               grapheme_clusters  next          scrub!       succ!      unicode_normalize!
  <=>          chomp        downcase!              gsub               next!         setbyte      sum        unicode_normalized?
  ==           chomp!       dump                   gsub!              oct           shell_split  swapcase   unpack             
  ===          chop         each_byte              hash               ord           shellescape  swapcase!  unpack1            
  =~           chop!        each_char              hex                partition     shellsplit   to_c       upcase             
  []           chr          each_codepoint         include?           prepend       size         to_f       upcase!            
  []=          clear        each_grapheme_cluster  index              pretty_print  slice        to_i       upto               
  ascii_only?  codepoints   each_line              insert             replace       slice!       to_r       valid_encoding?    
  b            concat       empty?                 inspect            reverse       split        to_s     
  bytes        count        encode                 intern             reverse!      squeeze      to_str   
  bytesize     crypt        encode!                length             rindex        squeeze!     to_sym   
  byteslice    delete       encoding               lines              rjust         start_with?  tr      
```

- using this in conjunction with the ruby docs lets us learn more


## show-doc
- show doc will show the documentation summary for a method:
  - example: end_with?
  - show-doc String#end_with?
  
```ruby
[2] pry(main)> show-doc String#end_with?

From: string.c (C Method):
Owner: String
Visibility: public
Signature: end_with?(*arg1)
Number of lines: 7

Returns true if str ends with one of the suffixes given.

  "hello".end_with?("ello")               #=> true

  # returns true if one of the suffixes matches.
  "hello".end_with?("heaven", "ello")     #=> true
	"hello".end_with?("heaven", "paradise") #=> false
```
- gives example of how to use the method
- gives info about args as well.


## load

- load isn't a pry command, but is useful to bring a whole file(of methods) into pry.
- if you start a pry session in the same folder as your .rb file, we can load it in to our pry session

```ruby
my_ruby_code/
└── code.rb
Then we can load the file into pry:

~/Desktop/my_ruby_code$ ls
code.rb

~/Desktop/my_ruby_code$ cat code.rb
def is_prime?(num)
  (2...num).each do |factor|
    return false if num % factor == 0
  end

  num > 1
end

~/Desktop/my_ruby_code$ pry
[1] pry(main)> load "code.rb"
=> true
[2] pry(main)> is_prime?(16)
=> false
[3] pry(main)> is_prime?(7)
=> true
[4] pry(main)>
```
- by using load 'code.rb' when we are in the same folder allows us to load all the methods in there and run the methods


## show-source
- show source will show us the code that implements a method, the source code
- ex: show-source is_prime?

``ruby
[5] pry(main)> show-source is_prime?

From: (pry) @ line 1:
Owner: Object
Visibility: public
Number of lines: 7

def is_prime?(num)
  (2...num).each do |factor|
    return false if num % factor == 0
  end

  num > 1
end
```

- this shows us info about the source code, the owner, vis, lines

-find more about pry here: https://github.com/pry/pry/blob/master/README.md

# Pry lecture notes
- use ls to find methods for specific objects or types
- 

# Bye Bug

## using byebug
- debugging tool, pause execution, go through code 1 line at a time.


## cheatsheet
- in debugger mode
	- l <start line>-<end line> - list the line numbers in the specified range
		- example: l 3-20
	- step or s, steps into the method call on the current line if possible
	- next or n, move to the next line of executed code
	- break <line num> or b <line num> - place a breakpoint at the specified line number, this will pause execution again
	- continue or c - resume normal execution of the code until a breakpoint
	- display <variable> - automatically show the current value of a variable

## running byebug
- before you can use byebug you need to do a few things
	- require 'byebug' to gain access to the gem
	- add a debugger line to pause the code to enter debugging mode

```ruby
# code.rb
1:  require "byebug"   #
2:   
3:  def is_prime?(number)
4:    (2...number).each do |factor|
5:      return false if number % factor == 0
6:    end
7:
8:    number > 1
9:  end
10:
11: def first_n_primes(num_primes)
12:   primes = []
13:   num = 2
14:   debugger        #
15:   while primes.length < num_primes
16:     primes << num if is_prime?(num)
17:     num += 1
18:   end
19:   primes
20: end
21:
22: p first_n_primes(11)
```

- use ruby code.rb which will run the file until it hits the debugger

```ruby
 10:
   11: def first_n_primes(num_primes)
   12:   primes = []
   13:   num = 2
   14:   debugger
=> 15:   while primes.length < num_primes
   16:     primes << num if is_prime?(num)
   17:     num += 1
   18:   end
   19:   primes
(byebug)
```
- in here, we can check the value of different variables by referencing the names

```ruby
(byebug) primes
[]
(byebug) num
```

## display
- using 'display' allows us to automatically track variables
```ruby
   10:
   11: def first_n_primes(num_primes)
   12:   primes = []
   13:   num = 2
   14:   debugger
=> 15:   while primes.length < num_primes
   16:     primes << num if is_prime?(num)
   17:     num += 1
   18:   end
   19:   primes
(byebug) display primes
1: primes = []
(byebug) display num
2: num = 2
```
- at this point we are at line 15, and prime = [], and num = 2

## next
- 'next' or 'n' allows us to execute the next subsequent code
- doesn't necessarily mean the next line(10 to 11), but follows the natural flow of the code
- if we are in a loop, it will follow the natural procedure(conditional branches, loops, etc)
- **IT WILL NOT STEP INTO ANOTHER METHOD CALL**. 

```ruby
(byebug) next
1: primes = []
2: num = 2

# [15, 18] in /Users/appacademy/Desktop/lecture/code.rb
   15:   while primes.length < num_primes
=> 16:     primes << num if is_prime?(num)
   17:     num += 1
   18:   end

```
- here, when we use next, it enters the while loop and checks the conditional if
- using next again will go to line 17 and add 1 to num

```ruby
(byebug) next
1: primes = [2]
2: num = 2

# [15, 18] in /Users/appacademy/Desktop/lecture/code.rb
   15:   while primes.length < num_primes
   16:     primes << num if is_prime?(num)
=> 17:     num += 1
	 18:   end
```
- 2 gets pushed into prime
- 1 gets added to num
- using 'n' again, goes back to line 15 to check the condition of our loop
```ruby
(byebug) next
1: primes = [2]
2: num = 3

# [15, 18] in /Users/appacademy/Desktop/lecture/code.rb
   15:   while primes.length < num_primes
=> 16:     primes << num if is_prime?(num)
   17:     num += 1
	 18:   end
```
- the while conditional is still true, so we go back to line 16
- 3 is prime, so it gets pushed into primes again
  
```ruby
(byebug) next
1: primes = [2, 3]
2: num = 3

# [15, 18] in /Users/appacademy/Desktop/lecture/code.rb
   15:   while primes.length < num_primes
   16:     primes << num if is_prime?(num)
=> 17:     num += 1
	 18:   end
```

```ruby
(byebug) next
1: primes = [2, 3]
2: num = 4

# [15, 18] in /Users/appacademy/Desktop/lecture/code.rb
   15:   while primes.length < num_primes
=> 16:     primes << num if is_prime?(num)
   17:     num += 1
	 18:   end
```
- continue this process until there are 11 primes in the array

## step
- since we are using next, we never see the code at line 16(if statement, is_prime?(num)) actually evaluate
- to do this we have to use step, which will 'step' into the method call

```ruby
(byebug) step
1: primes = (undefined)
2: num = (undefined)

# [1, 10] in /Users/appacademy/Desktop/lecture/code.rb
    1: require "byebug"
    2:
    3: def is_prime?(number)
=>  4:   (2...number).each do |factor|
    5:     return false if number % factor == 0
    6:   end
    7:
    8:   number > 1
    9: end
   10:
(byebug) display number
3: number = 4
(byebug) display factor
4: factor = (undefined)
```
- now that we called step, the debugger steps into the proper method call 
- since we stepped into this new method, our previously tracked variables(prime, num) are no longer in scope and are undefined
- we can now track other variables instead, like number, and factor
- we can use 'next'/'n' here to walk through the code as usual to see if its working properly.


## break and continue
- If you are done with a specific part of the code and want to check another section you can use 'break <line num>' to create a new break point to stop(like putting debugger)
- this allows us to not 'n' through all the code
- using 'continue' will let the code run as normal until/if it encounters a new breakpoint
```ruby
(byebug) break 19
# Created breakpoint 1 at /Users/appacademy/Desktop/lecture/code.rb:19
(byebug) continue
# Stopped by breakpoint 1 at /Users/appacademy/Desktop/lecture/code.rb:19
1: primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
2: num = 32
3: number = (undefined)
4: factor = (undefined)

# [13, 22] in /Users/appacademy/Desktop/lecture/code.rb
   13:   num = 2
   14:   debugger
   15:   while primes.length < num_primes
   16:     primes << num if is_prime?(num)
   17:     num += 1
   18:   end
=> 19:   primes
   20: end
   21:
   22: p first_n_primes(11)

```
- here, we put a breakpoint for after the while loop has evaluated and we return prime.  This lets us check if the method is returning the proper 

## summary
- make sure you are tracking how variables are changing overtime, and what logic is being evaluated.
- code will only evaluate to what you coded it to do, not what you want it to do
