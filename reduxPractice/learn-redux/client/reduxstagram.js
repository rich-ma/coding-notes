// let's go!
//if no ../rfdfs/react, it is coming from node
import React from 'react';
import { render } from 'react-dom';

//import css
import css from './styles/style.styl';

//import components
import Main from './components/Main';
import Single from './components/Single';
import PhotoGrid from './components/PhotoGrid';

//import react router dependencies
import { Router, Route, IndexRoute}

render(<Main/>, document.getElementById('root'));

