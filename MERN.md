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

## Mongoose
- A Straight forward schema based solution to model application data
- built in type casting, validation, query building, business logic hooks, and more


## bcrypt
- used to create a password salt
- bcrypt.genSalt(number of times to salt, callback function(err, salt) => {
  - bcrypt.hash(newUser.password, salt, (err, hash) => {
    - if(err) throw err;
    - newUser.password = hash;
    - 
  - }
- })

## User Auth
- We use Bcrypt to salt a pw for user login
- we use bcrpyt to compare the salted password with the entered password
- we use JSON web token to authenticate a user to login 
```javascript
// users.js
bcrypt.compare(password, user.password)
  .then(isMatch => {
    if (isMatch) {
      const payload = {id: user.id, name: user.name};

      jwt.sign(
        payload,
        keys.secretOrKey,
        // Tell the key to expire in one hour
        {expiresIn: 3600},
        (err, token) => {
          res.json({
            success: true,
            token: 'Bearer ' + token
          });
        });
    } else {
      return res.status(400).json({password: 'Incorrect password'});
    }
	})
```
- this code returns a signed web token for each login or register request to sign the user in on the front end.
- 


## passport
- Use passport to authenticate our token and construct private routes
- We had register and login save a jwt web token that we will want to use to authenticate every API request to the backend
- passport does this using different strategies, int his case we will be using JwtStrategy.
```javascript
// passport.js

const JwtStrategy = require('passport-jwt').Strategy;
const ExtractJwt = require('passport-jwt').ExtractJwt;
const mongoose = require('mongoose');
const User = mongoose.model('users');
const keys = require('../config/keys');

const options = {};
options.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
options.secretOrKey = keys.secretOrKey;

module.exports = passport => {
  passport.use(new JwtStrategy(options, (jwt_payload, done) => {
		User.findById(jwt_payload.id).then(user => {
			if(user){
				return done(null, user);
			}
			return done(null, false);
		})
		.catch(err => console.log(err));
	}));
};
```
- this is the passport payload, checks if a user with that correct credentials(id, auth token) exists
- Passport is dealing with JSON web token strategy
- JWTStrategy tells passport we want strat got jwt
- ExtractJWT, 
- options.jwtfromrequest, gets the jwt extracted from the header
- options secretOrKey = keys.secretOrKeys
- Passport uses the JWTStrategy, takes options, and a callback
  - callback takes payload(items we specified), done
- Done: keyword from express middleware, tells it to pass onto next middleware, 