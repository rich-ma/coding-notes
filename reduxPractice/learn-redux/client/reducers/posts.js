//reducer takes in two things
//1. action(info about what happened)
//2. copy of the current state
//then returns update state with new relevant info

function posts(state = [], action){

	switch(action.type){
		case 'INCREMENT_LIKES':
			const i = action.index;
			return [
				...state.slice(0, i), {...state[i], likes: state[i].likes + 1} ,...state.slice(i + 1)
			]
		default:
			return state;
	}
	
}

export default posts;