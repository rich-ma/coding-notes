You are given an array and you need to find number of tripets of indices  such that the elements at those indices are in geometric progression for a given common ratio  and .

For example, . If , we have  and  at indices  and .

Function Description

Complete the countTriplets function in the editor below. It should return the number of triplets forming a geometric progression for a given  as an integer.

countTriplets has the following parameter(s):

arr: an array of integers
r: an integer, the common ratio
Input Format

The first line contains two space-separated integers  and , the size of  and the common ratio.
The next line contains  space-seperated integers .

Constraints

Output Format

Return the count of triplets that form a geometric progression.

Sample Input 0

4 2
1 2 2 4
Sample Output 0

2
Explanation 0

There are  triplets in satisfying our criteria, whose indices are  and 

Sample Input 1

6 3
1 3 9 9 27 81
Sample Output 1

6
Explanation 1

The triplets satisfying are index , , , ,  and .

Sample Input 2

5 5
1 5 5 25 125
Sample Output 2

4
Explanation 2

The triplets satisfying are index , , , .


```javascript
// Complete the countTriplets function below.
function countTriplets(arr, r) {
    let dict = {};
    let dictSecond = {};
    let count = 0;

    arr.forEach(num => {
        //sees if first value in the triplet exists, if it does, logs how many if the first value are earlier in the array and stores that value in an array
        if(dict[num/r]){
            dictSecond[num] ? dictSecond[num] += dict[num/r] : dictSecond[num] = dict[num/r]
        }

        //checks to see if there are already any first and seconds in a triplet that exists and adds those values to count
        if(dictSecond[num/r]){
           count += dictSecond[num/r];
        }

        if(!dict[num]) dict[num] = 0;
        dict[num] += 1;
    })

    if(r === 1){
        count = 0;
        Object.keys(dict).forEach( num => {
            const factorialTop = dict[num] * (dict[num] - 1) * (dict[num] - 2);
            count += factorialTop/6;
        })
    };

    return count;
}
```

- first attempt at counttriplets
- need to account for when r = 1

- need to account for when triplets are not in order in index.  
- old version counted all values, need to only count the ones in order

- new code, but still doesnt address the first and second number not being in order 
- fixed issue with r = 1, used combinatorial statistics 

- finished the problem by creating a dictSecond that added each value.  Initially stored the values of each of the first of the triplets at each index, but it dosent matter since every time we enoucnter it, we are already adding how many we've passed