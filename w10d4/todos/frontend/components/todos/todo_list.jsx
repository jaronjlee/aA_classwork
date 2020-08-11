import React from 'react';
import TodoListItem from './todo_list_item'

class TodoList extends React.Component {
    constructor(props) {
        super(props);
    }
    
    render() {
        return(
            <div> 
                <h1>Todo List goes here!</h1>
                <ul>
                    <TodoListItem />
                    {this.props.todos.map((todo) => {
                        return (
                            <li key={todo.id}> 
                                <div>Body: {todo.body} </div>
                                <div>Done: {`${todo.done}`} </div>
                            </li>
                        )
                    })}
                </ul>
            </div>
        )
    }
}

export default TodoList;