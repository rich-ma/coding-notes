# day 16 
## text shadow with mouse movement
- use mouse location to dynamically update the shadow

- put 'contenteditable' allows us to edit the content
- will listen for mousemove event and that will tell us where to put text shadow. 

- e.target is what triggered the event, this is what the event listener was put on

- use e.target.offsetLeft, offsetTop to make up for the x and y resetting to 0

- can add multiple textShadows at a time, seperated by

