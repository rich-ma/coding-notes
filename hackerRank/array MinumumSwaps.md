You are given an unordered array consisting of consecutive integers  [1, 2, 3, ..., n] without any duplicates. You are allowed to swap any two elements. You need to find the minimum number of swaps required to sort the array in ascending order.

For example, given the array  we perform the following steps:

i   arr                         swap (indices)
0   [7, 1, 3, 2, 4, 5, 6]   swap (0,3)
1   [2, 1, 3, 7, 4, 5, 6]   swap (0,1)
2   [1, 2, 3, 7, 4, 5, 6]   swap (3,4)
3   [1, 2, 3, 4, 7, 5, 6]   swap (4,5)
4   [1, 2, 3, 4, 5, 7, 6]   swap (5,6)
5   [1, 2, 3, 4, 5, 6, 7]
It took  swaps to sort the array.

Function Description

Complete the function minimumSwaps in the editor below. It must return an integer representing the minimum number of swaps to sort the array.

minimumSwaps has the following parameter(s):

arr: an unordered array of integers
Input Format

The first line contains an integer, , the size of . 
The second line contains  space-separated integers .

Constraints

Output Format

Return the minimum number of swaps to sort the given array.

Sample Input 0

4
4 3 1 2
Sample Output 0

3
Explanation 0

Given array  
After swapping  we get  
After swapping  we get  
After swapping  we get  
So, we need a minimum of  swaps to sort the array in ascending order.

Sample Input 1

5
2 3 4 1 5
Sample Output 1

3
Explanation 1

Given array  
After swapping  we get  
After swapping  we get  
After swapping  we get  
So, we need a minimum of  swaps to sort the array in ascending order.

Sample Input 2

7
1 3 5 2 4 6 7
Sample Output 2

3
Explanation 2

Given array  
After swapping  we get  
After swapping  we get  
After swapping  we get  
So, we need a minimum of  swaps to sort the array in ascending order.

- swapping is odd in this method, its not greedy sorting, seems random?
- Could have made a mistake in the examples, will try greedy sort first and see if it works or not.

```javascript
function minimumSwaps(arr) {
    let swaps = 0;
    let currIndex = 0;
    let swappedIndex = 0;
    let sorted = arr.slice();
    sorted = sorted.sort();
    console.log(sorted);
    arr.forEach((num, i) => {
        console.log(i);
        if (arr[i] != sorted[i]) {
            swaps += 1;
        }
    });
    if (swaps === 0) return 0;
    if (swaps === 1) return 1;
    return swaps - 1;
}
```
- this code looks at the numbers in the wrong positions and assumes that any mistake can be fixed by that number - 1, passes the practice solutions, but not the actual submission.
- messed up in my logic, 0-2 out of position is that correct number, above that requires number-1;
- also doesn't work

- trying a new method where I will look at the position of the number, and determine if it is in the right position(index + 1), if it is, will not move it
- this looks to be what the code is doing, save the first example(wtf?).
```javascript
function minimumSwaps(arr) {
    let swaps = 0;
    let leftPointer = 0;
    while (leftPointer < arr.length) {
        if (arr[leftPointer] != (leftPointer + 1)) {
            for (let rightPointer = leftPointer; rightPointer < arr.length; rightPointer++){
                if (arr[rightPointer] === leftPointer + 1) {
                    [arr[leftPointer], arr[rightPointer]] = [arr[rightPointer], arr[leftPointer]];
                    swaps += 1;
                }
            }
        } 
        leftPointer += 1;
    }
    return swaps;
}
```
- test cases are huge, code takes forever to run
- this code can take a long time, but gets faster as time goes on as it doens't look over redundant positions as it moves forward.
- forgot to add break to the code, meaning it was running past when it was supposed to.

```javascript
function minimumSwaps(arr) {
    let swaps = 0;
    let leftPointer = 0;
    while (leftPointer < arr.length) {
        if (arr[leftPointer] != (leftPointer + 1)) {
            for (let rightPointer = leftPointer; rightPointer < arr.length; rightPointer++){
                if (arr[rightPointer] === leftPointer + 1) {
                    [arr[leftPointer], arr[rightPointer]] = [arr[rightPointer], arr[leftPointer]];
                    swaps += 1;
                    break;
                }
            }
        } 
        leftPointer += 1;
    }
    return swaps;
```