# day 19 Video cam

- building online cam
- video from webcam, then video goes onto a canvas element.

- will start with a server today, need a secure origin, https, or localhost.

- running webpack this time.
  - need to have https since using web cam requires a secure connection.

- will get video and put it into the canvas, and then we can edit it from there.

- ctx is where you do the work,

- we will use the navigator and getUserMedia to allow video to be true, and audio to be false, camera only.
- navigator returns a promise.

## navigator and video.src
- video source is expecting a url, so we use window.URL.createObjectURL onto the localmedia from the promise from the navigator.
- navigator is an object that contains information about the browser.
 **this is depreciated, use video.srcObject = localMediaStream**

- depreciated now, 

# error
- need to catch situation where use does not allow you access to camera, add it as a catch to the end of the promise.

## capture to canvas
- then we will take a frame from the video and paint it onto the screen.
- first we get videos height and width
- set interval to decide when we want the canvas to grab an image from the video stream.
- we use the context(ctx) to drawImage using the video as our source, then 0, 0 as the top left corner to start the image, and the width and height of the image to be that of the video.
- return the setInterval that way we can clearInterval on it. 

# event listener
----
- will use an event listener on videoElement called 'canplay' will look to see if the video is palyng, then will emit an event that the canvas will paint for you.

## take photo
- can play sound now, need to get data out of the video
- data = canvas.toDAtaURL('image/jpeg');
console.log(data);
- will convert canvas to data in base64, 

- then you create a link object that you can pre-pend to a list to show the different images youve taken so far
- the link.href will be the data that we created from the image
- the attribute will be ('downloaded', 'handsome')
- textcontent to downlaodimage
- then we use strip.insertBefore(link, strip.firstChild); 
- using link.innerHTML we can set it to a img element <img src=${data}>

# filters
- get pixels out of canvas, modify them, then put them back in.
- when we grab the pixels using ctx.getImageData we will get all the pixels from the image, and each rgba value correlated with it, can iterate through them skipping every 4 to get a new pixel.

## green screen
- using a const levels, we will set a range of greens that if they show up, we will remove
- set a max min for each rgb, and make that pixel invisible if it is within those values, then you can superimpose an image behind it.