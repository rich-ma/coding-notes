Emma is playing a new mobile game that starts with consecutively numbered clouds. Some of the clouds are thunderheads and others are cumulus. She can jump on any cumulus cloud having a number that is equal to the number of the current cloud plus  or . She must avoid the thunderheads. Determine the minimum number of jumps it will take Emma to jump from her starting postion to the last cloud. It is always possible to win the game.

For each game, Emma will get an array of clouds numbered  if they are safe or  if they must be avoided. For example,  indexed from . The number on each cloud is its index in the list so she must avoid the clouds at indexes  and . She could follow the following two paths:  or . The first path takes jumps while the second takes .

```javascript
function jumpingOnClouds(c) {
    let emma = 0;
    let jumps = 0;
    const clouds = c.length - 1;
    while (emma < clouds) {
        if (emma + 1 === clouds || emma + 2 === clouds) {
            jumps += 1;
            emma = clouds;
        } else if (c[emma + 2] === 0) {
            jumps += 1;
            emma += 2;
        } else if (c[emma + 1] === 0) {
            jumps += 1;
            emma += 1;
        } else {
            return undefined;
        }
    }
    return jumps;
}
```
