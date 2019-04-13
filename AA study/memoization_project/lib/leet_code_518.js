// Work through this problem on https://leetcode.com/problems/coin-change-2/ and use the specs given there.
// Feel free to use this file for scratch work.

function change(amount, coins, memo = {}) {
  let key = amount + '-' + coins;
  console.log(key);
  if (memo[key]) return memo[key];
  if (amount === 0) return 1;
  let count = 0;

  let curr_coin = coins[coins.length - 1];
  for (let i = 0; (i * curr_coin) <= amount; i++) {
    count += change(amount - i * curr_coin, coins.slice(0, -1), memo);
  }

  memo[key] = count;

  return memo[key];
};
function change(amount, coins) {
  let result = helper(amount, coins);
  if (result) return result.length;
  return 0;
};

function helper(amount, coins, memo = {}) {
  if (memo[amount]) return memo[amount];
  if (amount === 0) return [[]];
  let result = [];

  coins.forEach(coin => {
    if (amount >= coin) {
      let curr_change = helper(amount - coin, coins, memo);
      if (curr_change) {
        curr_change.forEach(combination => {
          let b = combination.slice();
          b.push(coin);
          b = b.sort();
          if (!result.some((prev_res) => {
              return JSON.stringify(prev_res) === JSON.stringify(b)
            })) result.push(b);
        });
      };
    }
  });

  if (result.length === 0) return 0;
  memo[amount] = result;
  return memo[amount];
};

console.log(helper(500, [1,2,5]));
// console.log(change(5000, [11,24, 37, 50, 63, 76, 89, 102]));