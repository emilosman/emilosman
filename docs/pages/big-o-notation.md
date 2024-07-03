# Big O Notation
- [CHEATSHEET](https://www.bigocheatsheet.com/)
- [Big O in 2 Minutes](https://www.youtube.com/watch?v=4TUgqm2gJkE)

O(n^2)

n = number of inputs

## Best to worst
- `O(1)` constant
- `O(log n)` divide and conquer
- `O(n)` proportional
- `O(n log n)` quicksort, mergesort, heapsort...
- `O(n^2)` loop within a loop 
- `O(2^n)`
- `O!`

## Different terms for inputs
`O(a + b)`
```python
def print_items(a, b):
    for i in range(a):
        print(i)

    for j in range(b)
        print(j)
```

`O(a * b)`
```python
def print_items(a, b):
    for i in range(a):
        for j in range(b)
            print(i, j)
```

## Big O of Lists
```python
    mylist = [11, 3, 23, 7]

    ## O(1)
    ## modifying at end of list
    mylist.append(7)
    mylist.pop

    ## O(n)
    ## reindexing
    mylist.pop(0) # popping first item
    mylist.insert(0, 11) # insert at index 0
    mylist.insert("Hi", 1) # still O(n) even if not at index 0
```
