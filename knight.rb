


require_relative "stepping_piece"
require_relative 'piece'


KNIGHT_DIFFS = [[-2, 1], [-2, -1], [-1, 2],
                [-1, -2], [1, 2], [1, -2], [2, 1], [2, -1]]

class Knight < Piece
  # include SteppingPiece

  def initialize(board, position, name, color)
    super(board, position, "KT ", color)
  end

  def moves
    filter_moves(find_lines(KNIGHT_DIFFS))
  end

end
