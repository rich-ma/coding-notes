# day 17
- array sort methods
- need to sort without 'The' , 'An', 'A'

- try on own first

- can use regex to read for first word, can also go through each word and find the first word and check if it is a, an, the, etc.

## regex
- using replace, we can search the first letters(using /^ to indicate the beginning, and check it against A, The, An)
- make it case insensitive using the /i tag at the end.
- replace will not modify the word if it does not find it, will return original word.

- create an li, and change its innerText to the band name
- append it ot th elist.

## video answer
- in the video, they grabbed the #bands by the id, then set its inner html 
- for the inner html, they mapped over the sorted bands and replaced it with a '<li>${band}</li>'
- then they joined them together.

- not sure which one is better, I think my code is easier to read and modify, this code is efficient though.  
- without the join it will leave the commas between the li elements.
