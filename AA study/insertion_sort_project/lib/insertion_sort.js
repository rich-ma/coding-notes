function insertionSort(arr) {
	if(arr[0] > arr[1]) [arr[0],arr[1]] = [arr[1], arr[0]];
	for(let i = 2; i < arr.length; i++){
		for(let j = 0; j <= i ; j++){
			let left = j - 1 >= 0 ? arr[j - 1] : -Infinity;
			if(arr[i] > left && arr[i] <= arr[j]){
				arr = arr.slice(0, j).concat(arr[i]).concat(arr.slice(j, i)).concat(arr.slice(i + 1));
			}			
		}
	}
	return arr;
}

module.exports = {
    insertionSort
};