import { createStore, compose } from 'redux';
import { synchHistoryWithStore } from 'react-router-redux';
import { browserHistory } from 'react-router';

//import root reducer
import rootReducer from'./reducers/index';

import comments from './data/comments';
import posts from './data/posts';

//create object for default data

const defaultState = {
	posts,
	comments
};

//database where we put all our info for the page
const store = createStore(rootReducer, defaultState);

export const history = synchHistoryWithStore(browserHistory, store);

export default store;

