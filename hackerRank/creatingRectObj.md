Objective

In this challenge, we practice creating objects. Check out the attached tutorial for more details.

Task

Complete the function in the editor. It has two parameters:  and . It must return an object modeling a rectangle that has the following properties:

: This value is equal to .
: This value is equal to .
: This value is equal to 
: This value is equal to 
Note: The names of the object's properties must be spelled correctly to pass this challenge.

Input Format

The first line contains an integer denoting . 
The second line contains an integer denoting .

Constraints

Output Format

Return a object that has the properties specified above. Locked code in the editor prints the returned object's , , , and  to STDOUT.

Sample Input 0

4
5
Sample Output 0

4
5
18
20
Explanation 0

Given a  of  and a  of , the Rectangle object's  is  and its  is .

2. Using a Constructor Function
We can use a constructor function to create an object in two steps:

Define the object type by writing a constructor function. The strong convention here is for the function's name to be in UpperCamelCase.
Use the new operator to create an instance of the object.
EXAMPLE

1
``` javascript
function Actor(firstName, lastName, Age) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.Age = Age;
}
​
var a1 = new Actor('Julia', 'Roberts', 48);
var a2 = new Actor('Kate', 'Winslet', 40);
​
console.log('Object \'a1\':', a1);

console.log('Object \'a2\':', a2);
```
- this creates an object using a constructor function, we are able to give the object different 

answer
```javascript
function Rectangle(a, b) {
    this.length = a;
    this.width = b;
    this.perimeter = 2 * (a + b);
    this.area = a * b;
}

```