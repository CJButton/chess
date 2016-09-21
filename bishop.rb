
require_relative "sliding_piece"
require_relative 'piece'

class Bishop < Piece
  include SlidingPiece

  def initialize(board, position, name, color)
    super(board, position, "BI ", color)
  end

  def moves
    filter_moves(find_lines(DIAGS))
  end


end
