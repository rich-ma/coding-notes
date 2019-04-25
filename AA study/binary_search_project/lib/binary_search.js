function binarySearch(array, target) {
	if (array.length === 0) return false;

	let midIdx = Math.floor(array.length / 2);

	if (target < array[midIdx]) {
		return binarySearch(array.slice(0, midIdx), target);
	} else if (target > array[midIdx]) {
		return binarySearch(array.slice(midIdx + 1), target);
	} else {
		return true;
	}
}

function binarySearchIndex(array, target) {
	if (array.length === 0) return -1;

	let midIdx = Math.floor(array.length / 2);

	if (target < array[midIdx]) {
		let result = binarySearchIndex(array.slice(0, midIdx), target);
		return result;
	} else if (target > array[midIdx]) {
		let result = binarySearchIndex(array.slice(midIdx + 1), target);
		if(result === -1) return result;
		else return midIdx + 1 + result;
	} else {
		return midIdx;
	}
}


module.exports = {
    binarySearch,
    binarySearchIndex
};