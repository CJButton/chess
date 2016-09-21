
require_relative "sliding_piece"
require_relative "piece"

class Queen < Piece
  include SlidingPiece

  def initialize(board, position, name, color)
    super(board, position, "QN ", color)
  end

  def moves
    filter_moves(find_lines(DIAGS)) + filter_moves(find_lines(STRAIGHT))
  end



end
