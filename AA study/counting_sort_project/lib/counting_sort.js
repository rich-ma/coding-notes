function countingSort(arr, max) {
	let counter = new Array(max + 1).fill(0);
	arr.forEach( num => counter[num]++);
	
	result = [];
	counter.forEach((times, num) => {
		for(let i = 0; i < times; i++){
			result.push(num);
		}
	})

	return result;

	// let counter = {};
	// arr.forEach( num => {
	// 	if(!counter[num]) {
	// 		counter[num] = 1;
	// 	} else {
	// 		counter[num]++;
	// 	}
	// });

	// let result = [];
	// for(num in counter){
	// 	console.log(num, counter[num]);
	// 	for(let i = 0; i < counter[num]; i++){
	// 		result.push(parseInt(num));
	// 	}
	// }
	// return result;
}


module.exports = {
    countingSort
};