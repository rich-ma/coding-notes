// function postComments(state = [], action){
// 	switch(action.type){
// 		case 'ADD_COMMENT':
			

// 		default:
// 			return state;
// 	}


// 	return state;
// }


function comments(state = [], action) {
	let newState = Object.assign({}, state);

	switch(action.type){
		case 'ADD_COMMENT':
			newState[action.postId].push({
				text: action.comment, 
				user: action.author
			})
			return newState;
		case 'REMOVE_COMMENT':
			newState[action.postId].splice(action.i, 1);
			return newState;
		default:
			return state;
	}
}

export default comments;

