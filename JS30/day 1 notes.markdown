# JS30 day 1, drumkit
 - can use a settimeout function to line up removing and adding the transition to the keydown.
 - better to use a transition end event.
 - grab all elements as an array using queryselectall, then in a forEach loop, check for a transitionend event.
 - look for css tranistion that takes the longest, in this case its transform,
  - allows us to guarantee that it will not break if smoeone comes in and changes it.
  - kind of like using a variable

- can keep code cleaner by writing a function for callback instead of writing it into the event listener.