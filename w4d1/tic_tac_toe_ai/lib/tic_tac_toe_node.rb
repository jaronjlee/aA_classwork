require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :human_player, :computer_player, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end
  
  # _ _ _
  # _ _ _
  # _ _ _
  
  def children
    children = []
    @next_mover_mark == :x ? @next_mover_mark = :o : :x
    (0...board.rows.length).each do |i|
      (0...board.rows.length).each do |j|
        if @board.empty?([i,j])
          @prev_move_pos = [i,j]
          @board[[i,j]] = @next_mover_mark
          new_node = TicTacToeNode.new(@board.dup, @next_mover_mark, @prev_move_pos)
          children << new_node
        end
      end
    end
    children
  end

  def losing_node?(evaluator)
    evaluator == :x ? other_mark = :o : :x
    return true if @board.over? && @board.winner == other_mark
    return false if @board.over? && @board.winner.nil? || @board.over? && @board.winner == evaluator
    if @next_mover_mark == evaluator
      return true if self.children.all? {|child| child.losing_node?(evaluator)} 
    elsif @next_mover_mark == other_mark
      return true if self.children.any? {|child| child.losing_node?(evaluator)}
    end
    false
  end

  def winning_node?(evaluator)
    evaluator == :x ? other_mark = :o : :x
    return true if @board.over? && @board.winner == evaluator
    return false if @board.over? && @board.winner.nil? || @board.winner == other_mark

    if @next_mover_mark == evaluator
      return true if self.children.any? {|child| child.winning_node?(evaluator)} 
    elsif @next_mover_mark == other_mark
      return true if self.children.any? {|child| child.winning_node?(evaluator)}
    end
    false
  end

  
end

