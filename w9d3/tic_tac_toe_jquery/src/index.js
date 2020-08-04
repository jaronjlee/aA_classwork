const View = require('./ttt-view.js');// require appropriate file ttt-view
const Game = require('./game.js');// require appropriate file game 

  $(() => {
    const game = new Game();
    const cont = $('.ttt');
    const view = new View(game, cont);
  });
