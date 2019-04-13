// Work through this problem on https://leetcode.com/problems/coin-change-2/ and use the specs given there.
// Feel free to use this file for scratch work.

function change(amount, coins) {
  if (amount === 0) return [[]];
  let result = [];

  coins.forEach(coin => {
    if (amount >= coin) {
      let curr_change = change(amount - coin, coins);
      if (curr_change) {
        curr_change.forEach(combination => {
          combination.push(coin);
          combination.sort();
          if(result.every(prev_res => {
              !_.isEqual(prev_res, combination);
            })){
            result.push(combination);
          }
        });
      };
    }
  });

  if (result.length === 0) return 0;
  return result;
};