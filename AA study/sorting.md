# Sorting

## Naive Sorting

### Bubble Sort
- Never a good industry choice
	- not efficient
	- not commonly used
	- noobish stigma
- Bubbling Up
  - item is in motion
  - item is moving in some direction
  - item has a final resting position
- When to use bubble sort
  - when sorting really small arrays, where run time will be negligible
  - sorted arrays that we expect to already be sorted
- O(n^2) time complexity at worst, O(1) space complexity


### Selection Sort
- Similar to bubble osrt, but selects smallest element and places them at the beginning in a sorted position
- O(n * n/2) = n^2/2, but we call that n^2.
- Selection sort does significantly less swaps than bubble sort, only one per iteration, while bubble sort can swap every single inner loop
- Can be useful in situation where swap is the most expensive operation in your system
- rarely encounter this, but a system with suboptimal write speed this could make the difference between crashing or not.
  
### Insertion Sort
![insertion sort](https://s3-us-west-1.amazonaws.com/appacademy-open-assets/data_structures_algorithms/naive_sorting_algorithms/insertion_sort/images/InsertionSort.gif)

- Similar to selection sort, but gradually builds up larger and larger sorted regions at one end of the array.
- Does not search for the "right" element to place, but finds the right place for each element.
- Steps:
  - Itearte across the input array one at a time
  - find the position in the sorted region that our element can be inserted while maintaining sorted elements
  - Insert element there
- O(n^2) time complexity
- O(1) space complexity

## Efficient Sorting

### Merge Sort
- time complexity: O(nlog(n))
- log n because it splits in half each call, and n because merge runs in n time, so n*log(n)

### Quick Sort
- Similar divide and conquer as merge sort
- divide input array into two subarrays, one with smaller elements, and one with larger elements
- continue this process until the arrays are length 1 or less.
- Find a pivot, put all elements smaller than it to the left, larger to the right
- repeat this for all smaller elements.
![quicksort](https://s3-us-west-1.amazonaws.com/appacademy-open-assets/data_structures_algorithms/efficient_sorting_algorithms/quick_sort/images/QuickSort.gif)

- Time complexity
  - avg case: O(nlog(n))
  - worst case: O(n^2)
- much more efficient than mergeSort, the recursive code is much lighter.
- if space is important, use a in place version that doesn't create new arrays to store elements.

### Radix Sort
- Radix sort is a non-comparison integer sorting algorithm
- its time complexity is is the best of the other sorting algs we've seen so far, but can only be used when sorting integers.
- Utlises a series of buckets that sort an array based on its integer at a specific level(10s, 100s, 1000s, etc)
- By sorting the array using the order the numbers entered the buckets, we get more and more sorted the more passes we take.
- Time complexity
  - The best, avg, and worst case are all the same for Radix sort
  - iterate over all n elements K times, it will always be O(n * k), where n is arr size, k is size of largest number
- people believe that when Radix sort input contains entirely unique values, k becomes log k.
- can end up with O(nlog(k)) or O(nlog(n)), so at worst, is equal to our fastest comparison based sorter.
- Space
  - uses O(n + k) space complexity
- When do we use it?
  - Want to use it when we need to:
    - sort binary data, numerics, text, image data in binary format
    - sort a list of integers, and dont know the largest value
      - if you do know the largest value, use countingSort();
  - Useful when k is small.
  
### Counting Sort

