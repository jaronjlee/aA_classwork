import React from 'react';

class TodoListItem extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return(
            <div>
                <ul>
                    {this.props.todos.map((todo) => {
                        return (
                            <li>Title: {todo.title} </li>
                        )
                    })}
                </ul>
            </div>
        )
    }     
}

export default TodoListItem;