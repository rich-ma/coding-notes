// Write a function, lucasNumberMemo(n), that takes in a number.
// The function should return the n-th number of the Lucas Sequence.
// The 0-th number of the Lucas Sequence is 2.
// The 1-st number of the Lucas Sequence is 1
// To generate the next number of the sequence, we add up the previous two numbers.
//
// For example, the sequence begins: 2, 1, 3, 4, 7, 11, ...
//
// Solve this recursively with memoization.
//
// Examples:
//
// lucasNumberMemo(0)   // => 2
// lucasNumberMemo(1)   // => 1
// lucasNumberMemo(40)  // => 228826127
// lucasNumberMemo(41)  // => 370248451
// lucasNumberMemo(42)  // => 599074578
// function lucasNumberMemo(n, memo = { }) {
//     if(memo[n]) return memo[n];
//     if(n===0) return 2;
//     if(n===1) return 1;
//     memo[n] = lucasNumberMemo(n - 1, memo) + lucasNumberMemo(n-2, memo);
//     return memo[n];
// }

function lucasNumberMemo(n, memo = {
    0: 2,
    1: 1
}) {
    if (memo[n]) return memo[n];
    memo[n] = lucasNumberMemo(n - 1, memo) + lucasNumberMemo(n - 2, memo);
    return memo[n];
}


// Write a function, minChange(coins, amount), that accepts an array of coin values
// and a target amount as arguments. The method should the minimum number of coins needed
// to make the target amount. A coin value can be used multiple times.
//
// After you pass the first 3 examples, you'll likely need to memoize your code 
// in order to pass the 4th example in a decent runtime.
//
// Examples:
//  
// minChange([1, 2, 5], 11)         // => 3, because 5 + 5 + 1 = 11
// minChange([1, 4, 5], 8))         // => 2, because 4 + 4 = 8
// minChange([1, 5, 10, 25], 15)    // => 2, because 10 + 5 = 15
// minChange([1, 5, 10, 25], 100)   // => 4, because 25 + 25 + 25 + 25 = 100
function minChange(coins, amount, memo = {}) {
    // if(memo[amount]) return memo[ammount];
    // if(amount === 0) return 0;
    // if(coins.length === 0) return 0;

    // curr_coin = coins[coins.length - 1];
    // count = 0;
    // curr_amt = amount;
    // console.log('curr_amt starts at', amount);
    // while(curr_amt >= curr_coin){
    //     curr_amt -= curr_coin;
    //     count +=1;
    //     console.log(curr_amt);
    // }
    
    // memo[amount] = count + minChange(coins.slice(0, coins.length - 1), curr_amt, memo);

    // return memo[amount];


    //minChanges
    // need to find a way to find optimal path for each value.
    // for each amount, we will give a recursive call to each possible denomination that can be removed, and return the combination with the smallest count.
    if (memo[amount]) return memo[amount];
    if(amount === 0) return 0;

    let best = null;
    let curr_count = null;
    let i = 0;
    while(i < coins.length){
        if(coins[i] <= amount){
            curr_count = 1 + minChange(coins, amount - coins[i], memo);
        } else {
            break;
        }

        if(best === null) best = curr_count;
        if(best > curr_count) best = curr_count;
        i++;
    }

    memo[amount] = best;
    return memo[amount];
}


module.exports = {
    lucasNumberMemo,
    minChange
};