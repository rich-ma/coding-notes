function merge(array1, array2) {
	let result = [];
	while(array1.length && array2.length){
		let lowest = (array1[0] < array2[0] ? array1.shift() : array2.shift());
		result.push(lowest);
	}
	return result.concat(array1.concat(array2));
}

function mergeSort(array) {
	if(array.length <= 1) return array;

	let mid = Math.floor(array.length/2);
	let left = mergeSort(array.slice(0,mid));
	let right = mergeSort(array.slice(mid));

	return merge(left, right);
}

module.exports = {
    merge,
    mergeSort
};