# modifying check boxes, shift click
- can use shiftKey to check if shift is being held or not, don't need to have a variable that toggles like I did in my code

```ruby
document.addEventListener('keyup', e => {if(e.key === 'Shift') shift = false});
document.addEventListener('keydown', e => {if(e.key === 'Shift') shift = true});
```

this is useless, just use the shiftKey variable associated to the keyEvent.  