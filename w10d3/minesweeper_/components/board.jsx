import Tile from './tile';
import React from 'react';

class Board extends React.Component{
  constructor(props){
    super(props);
    this.renderRows = this.renderRows.bind(this);
    this.renderTiles = this.renderTiles.bind(this);
  }

  render() {
    const board = this.props.board;
    const that = this;
    return(
      <div id="board">
        {this.renderRows()}
      </div>
    );
  }

  //mike's way without helper functions
  render() {
    const board = this.props.board;
    const that = this;
    return(
      <div id="board">
        {board.grid.map((row, i) => {
          <div key={i}>
            {row.map((tile, j) => {
              <Tile key ={i,j} tile={tile} updateGame={this.props.updateGame} />
            })}
          </div>
        }}
      </div>
    );
  }

  renderRows() {
    const board = this.props.board;
    return board.grid.map( (row, i) => {
      return (
        <div className="row" key={`row-${i}`}>
          {this.renderTiles(row, i)}
        </div>
      );
    });
  }

  renderTiles(row, i){
    const board = this.props.board;
    return row.map( (tile, j) => {
      return (
        <Tile
          tile={tile}
          updateGame={this.props.updateGame}
          key={i * board.gridSize + j} />
      );
    });
  }

}

export default Board;
