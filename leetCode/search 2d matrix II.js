/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
function searchMatrix(matrix, target) {
  for (let i = 0; i < matrix.length; i++) {
    let array = matrix[i];
    if (array[0] === target) {
      return true;
    } else if (array[array.length - 1] === target) {
      return true;
    } else if (array[0] < target && array[array.length - 1] > target) {
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

let c = [
  [1, 4, 7, 11, 15],
  [2, 5, 8, 12, 19],
  [3, 6, 9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
];

searchMatrix(c, 5);
searchMatrix(c, 20);
searchMatrix(c, 50);


// - bad code, couldve done it better 
// - should look at middle array, check its first and last, if first is larger than target, go down until last of the next one is bigger than it, 