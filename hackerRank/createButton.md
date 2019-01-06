Objective

In this challenge, we practice creating buttons in JavaScript. Check out the attached tutorial for learning materials.

Task

Complete the code in the editor so that it creates a clickable button satisfying the following properties:

The button's id is btn.
The button's initial text label is . After each click, the button must increment by . Recall that the button's text label is the JS object's innerHTML property.
The button has the following style properties:
A width of 96px.
A height of 48px.
The font-size attribute is 24px.
The .js and .css files are in different directories, so use the link tag to provide the CSS file path and the script tag to provide the JS file path:

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/button.css" type="text/css">
    </head>
    
    <body>
    	<script src="js/button.js" type="text/javascript"></script>
    </body>
</html>
Submissions

This is a new style of challenge involving Front-End rendering. It may take up to  seconds to see the result of your code, so please be patient after clicking Submit. The Submissions page contains screenshots to help you gauge how well you did.

Ask questions in the Discussions forum and submit any bug reports to support@hackerrank.com. Enjoy!

Explanation

Initially, the button looks like this:

initial

After the first  clicks, it looks like this:

four clicks

After  more clicks, it looks like this:

nine clicks

index.html
```html
<!-- Enter your HTML code here -->
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/button.css" type="text/css">
    </head>
    
    <body>
        <button id='btn' value=0></button>
        <script src="js/button.js" type="text/javascript"></script>
    </body>
</html>

```

button.js

```javascript
let button = document.querySelector('#btn');
button.innerHTML = 0;
button.addEventListener('mousedown', () => {
    button.innerHTML = parseInt(button.innerHTML) + 1;
})
```
- parses the innerHTML to int and adds 1 to it, not the best way, but is functional.

```css
#btns {
    display: grid;
    width: 75%;
    font-size: 24px;
    grid-template-columns: 30% 30% 30%;
    grid-template-rows: 48px 48px 48px;
}
```

```javascript
let btns = [...document.querySelector('#btns').children];
let btn5 = document.querySelector('#btn5');
let w = document.querySelector('body').style.offsetWidth;
btns
const order = [1,2,3,6,9,8,7,4,5]
let clicks = 0;

btn5.addEventListener('mousedown', () => {
    clicks += 1;
    [...btns.children].forEach(btn => {
        const pos = parseInt(btn.dataset.position);
        console.log(pos);
        if(pos !== 9){
            btn.innerHTML = order[pos + (clicks % 8)];
        }
    });
})
```
