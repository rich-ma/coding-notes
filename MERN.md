# MERN stack nodes

## Express.js
- allows for simple routing in our application
  
### Routing
- Instead of putting all the routes in the app.js, we organize it into its own route folder using express router
- routes/api/_____.js
  - plural(users, posts, likes, etc)
- const express = require("express");
- const router = express.Router();
- then we export it to be used in the App(similar to in rails);
- module.exports = router;
- The router can take all the HTTP methods(GET, POST, etc)
  - ex:
  - router.get('/test', (req, res) => res.json({msg: "this is test"}));
- In the app.js, we we import it, app.use(/api/users", )
  - if we get a request to the /api/users/, we will use whatever function we pass in, in this case the users we delcare at the top
    - const users = require('./routes/api/users');
    - app.use('api/users/', users);
- For any api/${route}/, it will use the router we created in that specific route, and we can specify what routes are allowed there.

## Nodemon package
- listens for changes to our application
- Node doesn't know what changes happen to our code, so nodemon listens to these changes
- it will restart the server for us with the updated code
- need to create an NPM run script in our package.json
- 'server': 'nodemon app.js'
- running npm run server, it will run with nodemon instead of default

## NOSQL
- Instead of using tables to store data, data is stores in documents(javascript objects, essentially)

## MongoDB
- connect to MongoDB using mongoose.connect(database,{ useNewUrlParser: true} )
- .then(()=> console.log("connected to mongodb")).catch(err => console.log(err));

## Node.js

### Debugging
- Can use console.log within our node app to see what is going on
- Can do it in chrome by going to package.json
- "server:debug": "nodemon --inspect app.js"
- gives us chrome devtools to look at nodejs.
- Can put debuggers into the code as well
  - will hit debuggers and debug it in chrome console.


