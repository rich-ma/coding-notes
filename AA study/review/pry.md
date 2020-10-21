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

