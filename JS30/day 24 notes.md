# day 24
- want the nav to stay at the top of the screen(did this already?)
- when the window.scrollY is past the top of the nav top, we will lock it to the top of the screen
  - access top of nav by using nav.offsetTop, this will tell us how far away the nav is from the top of the screen.

### CSS notes
- fixed elements take up no space, so if we put the nav as fixed, it will change the spacing of the other elements around it, kind of like on our full stacks where errors would push elements down,
- causes a reflow
- need to offset the amount so there is no jump
- will set document.body.paddingTop = nav.offsetHeight;

- cant animate width, but can  animate max-width;

should do some flexbot froggy for practice
