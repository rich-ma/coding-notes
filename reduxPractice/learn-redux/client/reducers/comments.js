function comments(state = [], action) {

	console.log('action', action.postId);
	let newState = Object.assign({}, state);
	console.log('newState', newState);

	switch(action.type){
		case 'ADD_COMMENT':
			let postId = action.postId;
			newState[postId].push({
				text: action.comment, 
				user: action.author
			})
			console.log(newState[postId]);
			return newState;
		default:
			return state;
	}
}

export default comments;