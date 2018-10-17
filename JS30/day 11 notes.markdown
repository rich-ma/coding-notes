# day 11 custom video player
- can use this.paused on the video to determine how you want to change the play button to pause or play.  
- better than checking the innerhtml, cleaner code
- textContent is better than innerHTML, its faster, doesnt parse html

- can use timeupdate to as an event to check when a videos currenttimeis changing.
- the event 'input' can be used for ranges to listen to not just chagnes, but mousedrags as well, onchange, change, etc, will only listen for when the value is changed, not while it is being dragged around.
- can use addEventListener('mousemove', mouseDown && scrub(e));
  - this allows us to cheat with the mechanics of && operator, if mouseDown is false, it will not run scrub, early exit, else it will run it. a