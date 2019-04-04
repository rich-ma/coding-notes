# Dynamic programming
- design pattern to solve large problems by dividing it into smaller subproblems
- avoid duplicate calculations by storing subproblems/subsolutions into additional datastructures
- memoization and tabulation are two strategies employed in DP.

## Memoization
- Everytime we call a function with a particular argument, we expect to get the same result
- because of this, we can store the result of that function call into an object to be used later so we don't call it again
- Two features of memoization:
  - function is recursive
  - the additional data structure used is typically an object(the memo)

### Applying memoization to factorial(n)
```javascript
function factorial(n){
  if(n === 1) return 1;
  return n * factorial(n-1);
}
```
- we can store known calls to this function in a memo object.
- that way, we can check if it exists and just grab it quickly from this object.
- 
```javascript
let memo = {}

function factorial(n){
  if(memo[n]) return memo[n];
  if(n === 1) return 1;

  memo[n] = n * factorial(n-1);
  return memo[n];
}
```
- this allows us to access an external data structure to quickly grab previous solutions to speed up our process.
- this code isn't great since big(O) is still n, and it uses a global variable.


- Can also memoize fib.
```javascript 
function fib(n) {
    if (n === 1 || n === 2) return 1;
    return fib(n - 1) + fib(n - 2);
}
```
- this is 2^n, very inefficient
- can store it in a memo but this time not globally.


```javascript 
function fib(n, memo = {1:1, 2:1}) {
    if(memo[n]) return memo[n];
    memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
    return memo[n];
}
```

### The memoization formula
- useful for when attacking recursive problems that have many overlapping/recurring sub problems
- useful to draw out visual tree first to find patterns
- hard and fast rules to memoization:
  1. write the unoptimized recursion code first.
  2. add memo object as an additional argument to the function
  3. add a base case to check the memoization
  4. store new calls in the memo and then return that value