// Work through this problem on https://leetcode.com/problems/minimum-path-sum/ and use the specs given there.
// Feel free to use this file for scratch work.

function minPathSum(grid) {
	let table = new Array(grid.length).fill().map(()=> new Array(grid[0].length).fill(Infinity));
	table[0][0] = grid[0][0];

	for( let m = 0; m < grid.length; m++){
		for( let n = 0; n < grid[0].length; n++){
			if( n < grid[0].length - 1){
				table[m][n + 1] = Math.min(table[m][n] + grid[m][n + 1], table[m][n + 1]);
			}
			if( m < grid.length - 1){
				table[m + 1][n] = Math.min(table[m][n] + grid[m + 1][n], table[m + 1][n]);
			}
			// if(m === 0 && n==0) continue;
			// let top = m-1 >= 0 ? table[m - 1][n] : Infinity;
			// let left = n - 1 >= 0 ? table[m][n - 1] : Infinity;
			// table[m][n] = top < left ? top + grid[m][n] : left + grid[m][n];
		}
	}

	return table[grid.length-1][grid[0].length-1];
}

console.log(minPathSum([
	[1, 3, 1],
	[1, 5, 1],
	[4, 2, 1]
]));