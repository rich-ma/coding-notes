// let's go!
//if no ../rfdfs/react, it is coming from node
import React from 'react';
import { render } from 'react-dom';

//import css
import css from './styles/style.styl';

//import components
import App from './components/App';
import Single from './components/Single';
import PhotoGrid from './components/PhotoGrid';

//import react router dependencies
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import { Provider } from 'react-redux'; 

import store, { history } from './store';

//creating a router that uses our Main as its component
//history allows us to change history, and Route lets us match routes we want to go to
//Route checks the url to see what it matches and will render it respectively
const router = (
	<Provider store={store}>
		<Router history={history}>
			<Route path='/' component={App}>
				<IndexRoute component={PhotoGrid}></IndexRoute>
				<Route path='/view/:postId' component={Single}></Route>
			</Route>
		</Router>
	</Provider>
)

render(router, document.getElementById('root'));

