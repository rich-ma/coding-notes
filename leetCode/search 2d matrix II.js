/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function (matrix, target) {
  matrix.forEach(array => {
    if (array[0] === target) { return true }
  });
};