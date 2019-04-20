function swap(arr, idx1, idx2) {
	[arr[idx1], arr[idx2]] = [arr[idx2], arr[idx1]];
	return arr;
}

function selectionSort(arr) {
	let lowest = Infinity;

	for(let i = 0; i < arr.length; i++){
		lowest = i;
		for(let j = i + 1; j < arr.length; j++){
			if (arr[j] <= arr[lowest]) lowest = j;
		}
		swap(arr, i, lowest);
	}

	return arr;
}

module.exports = {
    selectionSort,
    swap
};