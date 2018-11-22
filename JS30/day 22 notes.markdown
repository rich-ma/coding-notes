# day 22 follow along links
- want a hover effect where your cursor is followed by some sort of class effect where the item you are hovering will have its background change.  I bet its a class that gets added and removed depending on where your mouse is.
- can acheive this by finding the element with this class, removing it, and moving it to your current mouse target, we can transition from one location to another
- have some element offscreen that holds this class before hand. 
- confirmed that the class I want to add is called 'highlight'
  - adding it moves the entire element some reason.
  - fix by removing position absolute.
- need to write a function for the addeventlistener for each child that way it wont automatically add the highlight to each one.

- removed .highlight from prev highlight and onto the new one, but it still has the old class effect, need to find a way to remove the old class and put it back afterward, I could look at the parent and then add that class to it?

# video notes
- there are css transitions on the 
- need to make highlight
- const highlight = document.createElement('span');
- highlgiht.classList.add('highlight');
- document.body.append(highlight);

- create a function called highlight
  - will use getClientBoundingRect
  - const linkCoords = this.getBoundingClientRect();
  - gives us coordinates for the link


- add event listener for each trigger.
- add highlight,style.width = '${linkCoords.width}px'
- add highlight,style.height = '${linkCoords.height}px'
- will apply the style to those coordinates, not actually applying the class to each object like I thought to do.
- by doing this, we can take advantage of the transition style from the highlight 

- need to make the left linkCoords.left + window.scrollX
- and the top, linkCoords.top + window.scrollY
  - this will make up for whenever you scroll so it will add the transition effect to the correct area after scrolling
  - without this the transition will be off by the amount you've scrolled.
  
- Can refactor using deconstruction
```javascript
 const coords = {
      width: linkCoords.width,
      height: linkCoords.height,
      top: linkCoords.top + window.scrollY,
      left: linkCoords.left + window.scrollX
    };
```