# day 22 follow along links
- want a hover effect where your cursor is followed by some sort of class effect where the item you are hovering will have its background change.  I bet its a class that gets added and removed depending on where your mouse is.
- can acheive this by finding the element with this class, removing it, and moving it to your current mouse target, we can transition from one location to another
- have some element offscreen that holds this class before hand. 
- confirmed that the class I want to add is called 'highlight'
  - adding it moves the entire element some reason.
  - fix by removing position absolute.
- need to write a function for the addeventlistener for each child that way it wont automatically add the highlight to each one.

- removed .highlight from prev highlight and onto the new one, but it still has the old class effect, need to find a way to remove the old class and put it back afterward, I could look at the parent and then add that class to it?