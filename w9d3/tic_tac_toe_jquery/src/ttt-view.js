class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    
    this.setupBoard();
    this.bindEvents();
  }

  // $(selector).on(event, childSelector, data,function, map)

  bindEvents() {
    // install a handler on the `li` elements inside the board.
    this.$el.on("click", "li", (e) =>{
      e.preventDefault();
      this.game.playMove($(e.currentTarget).data("pos"));

      //set up click event
      //change mark (x or o shows up)
      //move class to li to show that it has been clicked on
    });
  }

  makeMove($square) { }
    

  setupBoard() {
    const $ul = $("<ul></ul>");

    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        let $li = $("<li></li>")
        $li.data("pos", [rowIdx, colIdx]);
    
        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
