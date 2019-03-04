/*
7. Reverse Integer
Easy

1949

2876

Favorite

Share
Given a 32 - bit signed integer, reverse digits of an integer.

Example 1:

  Input: 123
Output: 321
Example 2:

  Input: -123
Output: -321
Example 3:

  Input: 120
Output: 21
Note:
  Assume we are dealing with an environment which could only store integers within the 32 - bit signed integer range: [−231, 231− 1].For the purpose of this problem, assume that your
function returns 0 when the reversed integer overflows.
*/
var reverse = function (x) {
  let modifier = x < 0 ? true : false;
  x = x.toString().split('').reverse().join('');
  if (modifier) {
    x = '-' + x.slice(0, x.length - 1);
  }
  return Math.abs(parseInt(x)) > 2147483647 ? 0 : parseInt(x);
};

/*
Runtime: 84 ms, faster than 58.84 % of JavaScript online submissions
for Reverse Integer.
Memory Usage: 35.8 MB, less than 70.03 % of JavaScript online submissions
for Reverse Integer.
*/