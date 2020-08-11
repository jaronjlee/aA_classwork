import React from 'react';
import * as Minesweeper from '../minesweeper';

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            board: new Minesweeper.Board(9, 10)
        };
        
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame() {

    };

    render () {
        return (
            <div>
                Hello
                {/* <Board board={this.state.board} updateGame={this.updateGame}/> */}
            </div>
        )
    }
    
}

export default Game;
