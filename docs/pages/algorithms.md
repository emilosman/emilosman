# Algorithms
- [FLOWCHART](https://algo.monster/flowchart)
- [Top 7 Algorithms for Coding Interviews Explained SIMPLY](https://www.youtube.com/watch?v=kp3fCihUXEg)
- [Patterns: The Shortest-Path Algorithm for Coding Interviews](https://algo.monster/problems/stats)
- [Templates](https://algo.monster/templates)
- [Math basics](https://algo.monster/problems/math-basics)
- [Keywords](https://algo.monster/problems/keyword_to_algo)
- [Basic DSA](https://algo.monster/problems/basic_dsa)

## Binary Search
- Used to find a specific element in a sorted list efficiently.
- Inefficient: O(n) for linear search, incrementally guessing from start to end.
- Efficient: O(log2(n)) for binary search, repeatedly dividing the search interval in half until the correct element is found.

## Depth-First Search (DFS)
- Begins at the root node and explores as far as possible along each branch before backtracking.
- Utilizes a visited array to track already visited nodes.
- Continues backtracking until all nodes are visited.
- Real-life example: Solving a maze by systematically exploring paths until the exit is found.

## Breadth-First Search (BFS)
- Looks at every node at one level before going down to the next level.
- Utilizes a visited array to track already visited nodes and a queue to keep track of neighbors.
- Begins at the root node and adds it to the visited array and all its connected nodes to the queue, then continues to explore nodes level by level.
- Real-life example: Chess algorithms predict the best move by exploring possible moves at each level of the game tree.
- Runtime: O(V + E), where V is the number of vertices and E is the number of edges.

## Insertion Sort
- Examine’s each element in the list, comparing it with the previous elements and shifting them to the right until the correct position for insertion is found.
- Simple sorting algorithm suitable for small datasets or nearly sorted arrays.
- Runtime:
  - Best case: O(n) when the list is already sorted.
  - Worst case: O(n^2) when the list is sorted in reverse order.
  - Efficient for small or nearly sorted lists, but inefficient for large unsorted lists.

## [Merge Sort](/pages/merge-sort.md)
- A divide-and-conquer sorting algorithm that breaks the problem into smaller subproblems and solves them recursively.
- Starts by splitting the array into halves recursively until each subarray consists of single elements.
- Merges pairs of subarrays by comparing elements and placing them in sorted order.
- Continues merging subarrays until the full array is sorted.
- Runtime: O(n log(n)) in both best and worst cases, making it efficient for large datasets.

## Quick Sort
- A complex sorting algorithm that follows the divide-and-conquer approach and is recursive.
- Selects a pivot element, ideally close to the median, and partitions the list into two sublists: one with elements greater than the pivot and the other with elements less than the pivot.
- Continues the process recursively on each sublist until the entire list is sorted.
- Utilizes a pivot element that is moved to the end of the list, with pointers positioned at the leftmost and rightmost elements.
- Compares the elements pointed to by the left and right pointers, swapping them if necessary, until the pointers cross.
- Once the pivot is correctly positioned, the process repeats on the sublists.
- Runtime:
  - Best case: O(n log(n)), when the pivot consistently divides the list into approximately equal halves.
  - Worst case: O(n^2), when the pivot selection consistently results in unbalanced partitions. 

## Greedy Algorithm
- A problem-solving approach that makes the locally optimal choice at each stage with the hope of finding a global optimum.
- May not always guarantee an optimal solution but is often simple and efficient.
- Real-life example: Finding the shortest path in a weighted graph using Dijkstra's algorithm, where at each step, the algorithm selects the vertex with the smallest distance from the source.
