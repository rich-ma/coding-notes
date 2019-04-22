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

