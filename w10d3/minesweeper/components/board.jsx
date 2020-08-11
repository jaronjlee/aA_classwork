import React from 'react';

class Board extends React.component {
    constructor(props) {
        super(props)
    }

    render () {
        const board = this.props.board;
        const that = this;
        return(
            <div>
                {board.grid.map((row, i) => {
                    <div className= "row" key={`row {i}`}> 
                        {row.map((tile, j) => {
                            <Tile
                                tile = {tile}
                                updateGame = {this.props.updateGame}
                                key ={i * j}
                            />
                        })}
                    </div>
                })}
            </div>
        )
    }


    //mike's render
    render() {
        const board = this.props.board;
        const that = this;
        return (
            <div id="board">
                {board.grid.map((row, i) => {
                    <div key={i}>
                        {row.map((tile, j) => {
                            <Tile key={i, j} tile={tile} updateGame={this.props.updateGame} />
                        })}
                    </div>
                }}
            </div>
        );
}

export default Board;