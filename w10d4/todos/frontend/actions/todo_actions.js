export const RECEIVE_TODO = 'RECEIVE_TODO';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';

// export const receiveWashCarTodo = {
//     type: RECEIVE_TODO,
//     todo: {
//         id: 1,
//         title: 'wash car',
//         body: 'with soap',
//         done: false
//     }
// };

export const receiveTodo = todo => ({
    type: RECEIVE_TODO,
    todo
});

export const receiveTodos = todosArr => ({
    type: RECEIVE_TODOS,
    todosArr
});