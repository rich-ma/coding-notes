# dev tools, console tricks
- can inspect elements, Break on... 
  - look at attribute modification, will bring up a debugger that will pause where attributes change.
  - breakpoint to help you debug

## console.(things)

- console.log();
  - can interpolate, console.log('hello I am a %s string!, 'hello'), can also just use backticks ``

- console.log('%c I am some great text', 'font-size: 50px, background: red, text-shadow: 10px 10px 0 blue');
  - %c will allow you to add style to elements, in console, taken as a second argument, like %s, but with style instead of interpolating it.

- console.warn, gives stack trace of where warning came from.
- console.error, will also give stack trace

-console.info
  - console.info('this is cool stuff');
  - will put info for people to see.

-console.assert(condition, statement);
  - will run statement if condition is false.

-console.clear(), clear console.

- console.log DOM elements, 
  - can use console.dir instead to take a look at the entire element.

- console.group allows us to group together different console logs, (maybe more?)
  - start it with a tag of some sort, and end it with same tag
  console.group(name)
  console.groupEnd(name);
  - allows you to create a dropdown to help organize the console.

- console.count, can use it to count how many times something has been called, useful for tracking method calls.

-console.timing, or performance.now
  - console.time(string), then some event, then console.timeEnd(string)
  - need to use the same string at start and end.
  