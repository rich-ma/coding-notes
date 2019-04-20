function swap(array, idx1, idx2) {
 if(array[idx1] > array[idx2]){
	 array[idx1], array[idx2] = array[idx2], array[idx1];
 }
}

function bubbleSort(array) {
	let swapped = true;
	let iteration = 0;
	
	while(swapped){
		swapped = false;
		for( let i = 0; i < array.length - iteration; i++){
			if(array[i] < array[i + 1]){
				swapped = true;
				swap(array, i, i + 1);
			}
		}
	}

	return array;
}


module.exports = {
    bubbleSort,
    swap
};