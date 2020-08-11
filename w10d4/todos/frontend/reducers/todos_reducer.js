import { RECEIVE_TODO } from '../actions/todo_actions';
import { RECEIVE_TODOS } from '../actions/todo_actions';

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    let updatedState = { ...state };
    let newState = {};

    switch (action.type) {
        case RECEIVE_TODOS:
            action.todosArr.forEach((todo) => {
                newState[todo.id] = todo;
            })
            return newState;
        case RECEIVE_TODO:
            updatedState[action.todo.id] = action.todo;
            return updatedState; 
        default:
            return state;
    }

}

export default todosReducer; 