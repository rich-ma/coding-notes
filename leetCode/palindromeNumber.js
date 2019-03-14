/*
9. Palindrome Number
Easy

1258

1227

Favorite

Share
Determine whether an integer is a palindrome.An integer is a palindrome when it reads the same backward as forward.

Example 1:

  Input: 121
Output: true
Example 2:

  Input: -121
Output: false
Explanation: From left to right, it reads - 121. From right to left, it becomes 121 - .Therefore it is not a palindrome.
Example 3:

  Input: 10
Output: false
Explanation: Reads 01 from right to left.Therefore it is not a palindrome.
Follow up:

  Coud you solve it without converting the integer to a string ?
  */

  /**
   * @param {number} x
   * @return {boolean}
   */
  var isPalindrome = function (x) {
    if (x < 0) return false;
    let y = x.toString();
    let j = y.length - 1;
    for (let i = 0; i <= j; i++, j--) {
      if (y[i] != y[j]) return false;
    }
    return true;
  };