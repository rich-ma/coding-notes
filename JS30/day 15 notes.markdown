# day 15, local storage event delegation
- want to be able to refresh the page and persist state using local storage.
- also want event delegation to be able to 

- this in a submit action is the form itself, can use this.reset() to reset the form.

- for the ternary in vanilla js for input type checkbox, any existance of check will automatically check the box.

## local storage
- have an object in browser called local storage, list of things stored on domain.
- able to save text to browser and can grab stuff from it.
- localStorage.setItem('items', JSON.stringify(items));
  - using JSON.stringify allows us to stringify the content
  - JSON.parse will turn it back into an object.
- local storage takes strings and we can use json .stringify to store it, and then json.parse to turn it back into an object to be read later.
- we can store anything under localstorage like an object. localStorage.setItem('name', 'item');


## event delegation, 
- rather than listen for lcick or change on checkboxes, look for somebody that will be on the page at time of listening, the UL is always there.
- can listen for a click on the plate, and the UL will tell it to click.
- listen on some ancestor/parent, and use currentTarget/Target to dictate whether or not an event should occur.

