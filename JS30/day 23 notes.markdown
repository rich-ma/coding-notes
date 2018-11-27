# day 23 notes 
- will be able to change rate and pitch
- can make buttons that will save rate and pitch and be able to name it whatever you want.

- rate changes how fast, pitch changes pitch
- text area will be the text that is read
- the name needs to line up with the property of the voice that reads the values for pitch, rate, text.
  - needs to match up with utterance.

# starter code
- need to start new speechSynthesisUtterance, which contains rate, pitch, voice, and text.
- the 4 arguments will need to be put onto the utterance. 


## populating voices
- speechSynthesis utterance is some message that could be spoken
- can call speak on speechSynthesis and pass it an utterance
- can add event listener to speechSynthesis for the event voices change to populate the voices. 

```javascript
 function populateVoices(){
    let voices = speechSynthesis.getVoices().filter(voice => voice.lang.slice(0,2) === 'en');
    voicesDropdown.innerHTML = voices.map(voice => (
      `<option value='${voice.name}'>${voice.name} (${voice.lang})</option>`
    )).join('');
  }
```
- in this code we grab the voices, filter them for ones that are in english, and then map to to options for the dropdown, joining them and setting the dropdown innerHTML.
- this allows to to quickly populate the dropdown list for the voices.
- using e.target doesn't work well.

## self notes
- NEed to access the rate, pitch, text, and voice for the message. set them
- need to addEventListeners to the stop, speak, rate, pitch, and voice to recognize changes.
  - these will affect the msg, speak, stop will affect the speechSynthesis

- rate/pitch/text are selected together, can use a forEach and eventlistener for each
  - need to use 'input' as the action
- for the toggle function we will stop it at the beginning, that way it will either stop, or restart.


# take aways
- can set msg variables like msg.[this.value]
- need to wait for page to load to grab voices otherwise it will be blank.
- using default values can be powerful for the toggle function, allowing flexibility for the function.