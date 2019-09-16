# Redux notes
## Actions, Action creators, and reducers
- action: something that happens in your application.
- this action dispatches an action(like post, add comment, etc)
  - and dispatches some data(who, what, when, where, etc)
- actions are just objects with two things
  - a type: what type of action to dispatch(like, comment ,etc)
  - data: some data that is sent to the reducers

## Action creators
- get dispatched with info about what happens from an action
- doesnt update our store in redux, need to create a reducer

## Reducer
- sends data to our frontend to update our state.
- actions are regular javascript events that trigger an event
- if nobody is listening to the changes, the webpage will not update
- create a reducer for every piece of state
  - posts
  - comments
  - users
- Reducers take two things
    1. action(info about what happened)
    2. copy of the current state
- Use a root reducer to combine our reducers together for the state.


### provider
- The provider connects our redux to react
- exposes store to our application

### Dispatch
- dispatch function allows us to fire off the actions.
- dispatched actions go to all reducers, and it is on the dev to decide what reducers take action for each action that is dispatched


## Accessing dispatch and state
- how to get state to get into main, normally we get it from provider and pass it down til you get to where you want
- in redux we have **CONNECT**, and can inject it wherever we want it
- Main.js is mostly a presentation component, we can infuse it with action creators using another component that will inject the info onto.
- app.js
- We use the connect and use mSTP and mDTP take the state and dispatch and surface the function via props in our components, this.props
- Going to surface the data and fucntions to components that we want to have them.
- MapStateToProps
  - 
- mapDispatchtoProps
- Connect allows us to pass props directly to the component that we want without having to pass it along all children

## displaying redux state inside components

## reducers
-	redux uses functional programming
- we don't mutate our state and use pure function
  - pure functions are functions that give a predictable output without modifying anything that is outside of its function.
  - We make a copy, modify it, and then return new state so we don't modify the old one
- pure functions don't mutate external state, and are predictable
- reducers get run for every action, we use a switch statement to act on it
- the switch of each reducer will check the action.type to find ones it want to react on(like a controller in MVC model)
- default state will return state
  - if we don't act on that specific action, we should return the default state to not modify anything
- 
