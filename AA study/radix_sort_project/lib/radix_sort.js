function radixSort(arr) {
	if(!Array.isArray(arr)) return null;
	if(arr.length === 0) return arr;
	let max = getMaxLength(arr);
	console.log(max);

	for( let i = 0; i < max; i++){
		let buckets = new Array(10).fill().map(() => new Array());
		arr.forEach(num => {
			buckets[getDigitFrom(num, i)].push(num);
		});

		arr = [].concat(...buckets);
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

	if(greatest === 0) return 1;

	return Math.floor(Math.log10(Math.abs(greatest))) + 1;
}

module.exports = {
    radixSort
};