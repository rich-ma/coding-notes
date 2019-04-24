function radixSort(arr) {
	let max = getMaxLength(arr);


	for( let i = 0; i < max; i++){
		let buckets = new Array(10).fill().map(() => new Array());
		arr.forEach(num => {
			buckets[getDigitFrom(num, i)].push(num);
		})
		arr = [];
		buckets.forEach( bucket => {
			bucket.forEach( num => arr.push(num));
		})
	}

	return arr;
}

function getDigitFrom(num, place){
	return Math.floor(num/(Math.pow(10, place))) % 10;
}

function getMaxLength(arr){
	let greatest = -Infinity;
	arr.forEach( num => {
		if(num > greatest) greatest = num;
	})

	return Math.floor(Math.log10(Math.abs(greatest))) + 1;
}

module.exports = {
    radixSort
};