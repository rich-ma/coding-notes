Given a time in -hour AM/PM format, convert it to military (24-hour) time.

Note: Midnight is 12:00:00AM on a 12-hour clock, and 00:00:00 on a 24-hour clock. Noon is 12:00:00PM on a 12-hour clock, and 12:00:00 on a 24-hour clock.

Function Description

Complete the timeConversion function in the editor below. It should return a new string representing the input time in 24 hour format.

timeConversion has the following parameter(s):

s: a string representing time in  hour format
Input Format

A single string  containing a time in -hour clock format (i.e.:  or ), where  and .

Constraints

All input times are valid
Output Format

Convert and print the given time in -hour format, where .

Sample Input 0

07:05:45PM
Sample Output 0

19:05:45


```javascript
function timeConversion(s) {
    /*
     * Write your code here.
     */
    let afterNoon = s[8] === 'P' ? true : false;
    let hour = parseInt(s.slice(0,2));
    if (hour === 12) hour = 0;

    if(afterNoon) hour += 12;
    if(hour < 10) hour = '0' + hour;

    return hour + s.slice(2, 8);
}
```
I determine AM/PM, then determine the hour.

PM is essentially AM+12hr, except for the midnight-1AM case where AM/PM displays 12:xx, but 24 hour would display 00:xx.  

In this case I just reduce all 12 hours to 0, and add 12 to the hour in the case of PM.

Then I add a 0 to fit the formatting of hh:mm:ss