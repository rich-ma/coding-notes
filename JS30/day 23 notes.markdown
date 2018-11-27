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


## self notes
- NEed to access the rate, pitch, text, and voice for the message. set them
- need to addEventListeners to the stop, speak, rate, pitch, and voice to recognize changes.
  - these will affect the msg, speak, stop will affect the speechSynthesis

- rate/pitch/text are selected together, can use a forEach and eventlistener for each
  - need to use 'input' as the action
=