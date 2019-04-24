function quickSort(array) {
	if (array.length <= 1) return array;

	let pivot = array.shift();
	let left = [];
	let right = [];
	array.forEach( num => {
		if (num <= pivot){
			left.push(num);
		} else {
			right.push(num);
		}
	})

	left = quickSort(left);
	right = quickSort(right);

	return left.concat(pivot).concat(right);
}


module.exports = {
    quickSort
};