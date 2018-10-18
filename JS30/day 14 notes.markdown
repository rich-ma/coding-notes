# day 14 reference vs copy
when you set an array to another array and modify the second, it will modify the first as well.
- can call slice on the original array to make a copy of it. 


```javascript
a = [1,2,3,4,5];
```
3 ways
- call slice on original array.
  - let b = a.slice();
- concat original array into an empty array.
  - let b = [].concat(a);
- use the es6 spread operator
  - let b = [...a];

```javascript
const person = {
      name: 'Wes Bos',
      age: 80
    };
```


same applies to objects in javascript, POJOs.
- is not a deep dup, only superficial copy.
- let b = {...person}
