//reducer takes in two things
//1. action(info about what happened)
//2. copy of the current state
//then returns update state with new relevant info

function posts(state = [], action){
	console.log('the post will change');
	console.log(state, action);
	return state;
}

export default posts;