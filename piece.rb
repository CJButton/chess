
require_relative 'board'

class Piece
  attr_reader :name, :board
  attr_accessor :position, :color
  def initialize(board, position, name, color)
    @board = board
    @position = position
    @name = "p"
    @color = color
  end

  def filter_moves(arr)
    end_positions = []
    arr.each do |move|
      end_positions << move if valid_moves?(move)
    end
    end_positions
  end

  def valid_moves?(pos)
    dx, dy = pos

    unless dx > 7 || dx < 0 || dy > 7 || dy < 0
      if @board.board[dx][dy].is_a?(NullPiece)
        return true
      elsif @board.board[dx][dy].is_a?(Piece)
        return true if @board.board[dx][dy].color != self.color
        #TODO add return if the implicit return here doesn't work
      end
    end
    false
  end

  def moves

  end

end
