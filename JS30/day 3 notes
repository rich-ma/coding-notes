# playing with css variables
- can use :root and then --(variable) to create new variables to use in css. New to css.

```javascript
:root {
      --base: #ffc600;
      --spacing: 10px;
      --blur: 10px;
    }

    img {
      padding: var(--spacing);
      background: var(--base);
      filter: blur(var(--blur));
    }
```
-uses a data attribute called data-sizing to append px, or whatever unit, vh, pem, etc onto the end of a data attribute
document.documentElement.style.setProperty(`--${this.name}`, this.value + suffix);
this allows us to set the variable we created on the root earlier.

declaring the variables on root allows us access to them at all times.
