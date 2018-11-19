# day 18
- add total number of time from youtube.
- read time stamps from youtube and parse it for time.

- can find specific nodes and find the data-time.
- parse the string, split by the colon
- data-time.split(':'),
- first one is minute, second one is minutes.


- videos.children creates an htmlCollection, can use spread operator to convert it into a string, then can parse the individual dataset.time.  
- save mintes and seoncds instead of total time, at the end add seconds/60 and then set seconds to itself % 60 to reset to correct seconds.
- parseInt for each dataSet


## video
- in the lesson, he created an Array.from(document.querySelectorAll('[data-time]'))
- this allows him to skip the grabbing videos and allows him to call forEach directly
- I think both methods are ok.
- he maps over the timeNodes, getting all the dataset.times, then maps over all of those and does what I did with the splitting and then maps.
  - not sure this method is better, hes mapping several times
  - grabbing the data-time is better though.
- can use const [mins, secs] = timeCode.split(':'); 
  - cleaner than [mins, secs] = [time[0], time[1]];
- can map and call the function parseFloat, or parseInt will automatically call the function on the strings. 
- he kept all the seconds together, converting minutes to seconds, that way he can convert it all at the end
