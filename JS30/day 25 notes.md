# day 25 notes, event propogation

- starting with 3 nested divs
- when you click on the inner one, the event will propgate up to the first one.
- need to stop propogation, *bubbling up*


## how does it wokr?
- browser will capture the event, and ripple down from the top down, document, one, two, three
- caputre goes from top down, then will bubble up, triggering the events.
- capture figures out what got clicked on
- bubbling up is triggering the actual event
- use stopPropagation to stop the bubbling
  - will stop bubbling the event up, will only do the most precise click.

- can add a third argument to the add event listener
  - third argument is an options object,
  - can add { capture: true}
  - this will make it so that the method is run on the capture, going down, instead of on the bubbling up propagation.
  - default is false;

- what will happen if we have stopPropagation and capture: true?
  - it will stop after one, since it is firing on the way down and stops after the first one.
  