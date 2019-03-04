// Repeating Characters
// Medium

// 4894

// 252

// Favorite

// Share
// Given a string, find the length of the longest substring without repeating characters.

// Example 1:

//   Input: "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.
// Example 2:

//   Input: "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.
// Example 3:

//   Input: "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Note that the answer must be a substring, "pwke"
// is a subsequence and not a substring.

var lengthOfLongestSubstring = function (s) {
  if (s.length === 0) return 0;
  longestWord = s[0];
  currWord = s[0];
  let i = 0,
    letter;
  for (let j = 1; j < s.length; j++) {
    letter = s[j];
    if (currWord.includes(letter)) {
      i = i + s.slice(i).indexOf(letter) + 1;
      currWord = s.slice(i, j);
    }
    currWord = currWord + letter;
    if (currWord.length > longestWord.length) longestWord = currWord;

  }
  return longestWord.length;
};
// Runtime: 92 ms, faster than 88.27 % of JavaScript online submissions
// for Longest Substring Without Repeating Characters.
// Memory Usage: 41.2 MB, less than 46.39 % of JavaScript online submissions
// for Longest Substring Without Repeating Characters.

// this code works by keeping track of the current word and checking it to the longest word.
//if the word we are looking at includes the newest character we will shift the current start
/*
not the most efficient since it uses indexOf, which in worse case could be the length of the string everytime.


*/