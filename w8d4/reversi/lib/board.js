//   0 1 2 3 4 5 6 7
// 0 _ _ _ _ _ _ _ _
// 1 _ _ _ _ _ _ _ _
// 2 _ _ _ X _ _ _ _
// 3 _ _ X W B _ _ _
// 4 _ _ _ B W X _ _
// 5 _ _ _ _ X _ _ _  [3, 4], [4, 5]     [4 + 1, 5 + 1]
// 6 _ _ _ _ _ _ _ _
// 7 _ _ _ _ _ _ _ _


let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);

  for (let i = 0; i < 8; i++) {
    grid[i] = new Array(8);
  }

  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  //test pieces
  // grid[2][0] = new Piece("black");
  // grid[3][0] = new Piece("black");
  // grid[4][0] = new Piece("black");
  // grid[5][0] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0]; 
  let y = pos[1]; 

  if (x < 0 || y < 0 || x > 8 || y > 8) return false;

  return true; 
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  
  if (!this.isValidPos(pos)) {
    throw new Error('Not valid pos!');
  } else {
    // console.log(pos)
    return this.grid[pos[0]][pos[1]];
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  if (piece) return piece.color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!this.grid[pos[0]][pos[1]]

  // if (this.getPiece(pos)) {
  //   return true;
  // } else {
  //   return false;
  // };
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color. //if not isValidPos 
 *
 * Returns empty array if it hits an empty position. //isOccupied 
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){
  // console.log(!this.isOccupied(pos));
  let newPos = [pos[0] + dir[0], pos[1] + dir[1]]; 

  if (!this.isValidPos(newPos) || !this.isOccupied(newPos)) return [];

  if (this.isMine(newPos, color)) {  
    return piecesToFlip;
  } else {
    piecesToFlip.push(newPos); 
    return this._positionsToFlip(newPos, color, dir, piecesToFlip);      
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) return false; 

  for (let i = 0; i < Board.DIRS.length; i++) {
    let values = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (values.length > 0) return true; 
  }

  return false; 
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error('Invalid Move');
  } 

  let allPos = []; 
  
  for(let i = 0; i < Board.DIRS.length; i++) {
    let values = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (values.length === 0) continue; 
    
    let lastSpot = [ (Board.DIRS[i][0] + values[values.length - 1][0]), (Board.DIRS[i][1] + values[values.length - 1][1]) ];
    if (
      this.isOccupied(lastSpot) && 
      this.getPiece(lastSpot).color === color
      ) {
        allPos.push(values);
      }
  }
   
  // allPos.flat(1);
  for (let i = 0; i < allPos.length; i++) {
    for (let j = 0; j < allPos[i].length; j++) {
      let piece = this.getPiece(allPos[i][j]);
      piece.flip();
    }    
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);
};


/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let result = []; 
  for(let i = 0; i < 8; i++) {
    for(let j = 0; j < 8; j++) {
        pos = [i,j]
        if (this.validMove(pos, color)) result.push(pos); 
    }
  }

  return result;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};



module.exports = Board;


//opponent loses when majority of pieces are converted to the other players color 
//trapped pieces in either row column or diagonal turn into players color 


//  Returns an empty array if it reaches the end of the board before finding another piece
//  of the same color. //if not isValidPos 
//  
//  Returns empty array if it hits an empty position. //isOccupied 
//  
//  Returns empty array if no pieces of the opposite color are found.
//
//  if (!this.isValidPos(pos) || !this.isOccupied(pos)) return [];
//   
//   let values = []
//
//   let newPos = [pos[0] + dir[0], pos[1] + dir[1]]; 
//   if getPiece(newPos).color != color {  
//    values = positionsToFlip(newPos, color, dir, piecesToFlip);      
//    values.push(newPos); 
//   }
//
//   return values;
//    
//
//



// testGrid = new Board(); 
// moves = testGrid.validMoves(); 
// console.log(moves); 
// // console.log(testGrid); 
// console.log(testGrid._positionsToFlip([1,0], 'white', [1, 0]));

// console.log(Board.DIRS); 