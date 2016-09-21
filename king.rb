


require_relative "stepping_piece"
require_relative 'piece'

KING_DIFFS = [[0, 1], [0, -1], [-1, 0], [1, 0], [1, 1],
                            [-1, 1], [1, -1], [-1, -1]]

class King < Piece
  # include SteppingPiece

  def initialize(board, position, name, color)
    super(board, position, "KN ", color)
  end

  def moves
    filter_moves(find_lines(KING_DIFFS))
  end


end
