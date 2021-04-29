# Data Structures

## Trees
- Trees store data in a hiearchy of layers
- an element, or node at each layer connects to other nodes in higher or lower levels
- the top level node is called the **root**
```markdown
* /
    * Users
        * ruggeri
            * Desktop
            * Documents
            * Downloads
        * patel
            * Desktop
            * Downloads
    * System
        * Library
```
- the nodes one level deeper are called children, the lowest level nodes are called leaves
- nodes can have any number of children, there are also **binary trees** that only have 2 childre at most, and are usually called left and right children.
- an array and a tree are two different types of **Data structures**.
- data structure is a way of storing and organizing data in a computer so it can be stored or used efficiently. 

## Depth first search(DFS)
- Given a tree, you may want to enumerate all of the values
- one common way to traverse(visit all the nodes) is via a depth first search.
```markdown
          1
         / \
        2   5
       /   / \
      3   6   9
     /   / \
    4   7   8
```
- in depth first search, you search through the one child, and their left/first child until we hit the bottom. we go up one level and continue.
- https://upload.wikimedia.org/wikipedia/commons/7/7f/Depth-First-Search.gif

## Breadth First Search(BFS)
- alternatively we can do BFS, where we visit and node and all its children before going deeper and checking their childrens children
- https://upload.wikimedia.org/wikipedia/commons/4/46/Animated_BFS.gif


## Algorithm
- DFS and BFS are algorithms
- algorithms and methods differ in that an aglorithm is an idea/concept that can be written to solve some process and can be written in any language.
- a method is an implementation of an algorithm into a language like ruby to be fun.
- 