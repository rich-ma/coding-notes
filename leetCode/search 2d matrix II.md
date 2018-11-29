``` javascript
/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
function searchMatrix(matrix, target) {
  for (let i = 0; i < matrix.length; i++) {
    let array = matrix[i];
    if (array[0] === target) {
      console.log('hi');
      return true;
    } else if (array[array.length - 1] === target) {
      console.log('hey');

      return true;
    } else if (array[0] < target && array[array.length - 1] > target) {
      console.log('hello');
      //binary search here
      let index = array.indexOf(target);
      if (index === -1) {
        continue;
      } else {
        console.log(index);
        return true;
      }
    } else {
      continue;
    }
  }
  return false;
};
```

- bad code, couldve done it better 
- should look at middle array, check its first and last, if first is larger than target, go down until last of the next one is bigger than it, 