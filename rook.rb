require_relative "sliding_piece"
require_relative "piece"

class Rook < Piece
  include SlidingPiece

  def initialize(board, position, name, color)
    super(board, position, "RK ", color)
  end

  def moves
    filter_moves(find_lines(STRAIGHT))
  end



end
