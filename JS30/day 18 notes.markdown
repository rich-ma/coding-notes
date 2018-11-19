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