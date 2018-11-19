# day 20, speech to text
- chrome uses webkit.speechrecognition
- using recognition.interimResults will log reuslts as you speak.
  - as you are speaking, will populate, otherwise will only work after you stop.
- browser will tell us when it is done
- create new paragraph elements everytime you are done speaking
- append it to the words div as a paragraph.

# event listeners
- adding a event listener for a result on the recognition object will allow us to do speech to text that we can convert and append to our list.
- we need to put an end event listener so that we can start listening again, otherwise it wont correctly start listening for other events. 

- can try other types of text edits, like auto censoring words like shit/poop/poo etc