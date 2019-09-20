import { createStore, compose } from 'redux';
import { syncHistoryWithStore } from 'react-router-redux';
import { browserHistory } from 'react-router';

//import root reducer
import rootReducer from'./reducers/index';

import comments from './data/comments';
import posts from './data/posts';
import { __esModule } from 'react-router-redux/lib/middleware';

//create object for default data

const defaultState = {
	posts,
	comments
};

//database where we put all our info for the page
const store = createStore(rootReducer, defaultState);

export const history = syncHistoryWithStore(browserHistory, store);

if(module.hot){
	module.hot.accept('./reducers/', () => {
		const nextRootReducer = require('./reducers/index').default;
		store.replaceReducer(nextRootReducer);
	});
}

export default store;

