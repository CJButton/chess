require_relative "sliding_piece"
require_relative 'piece'

class Rook < Piece
  include SlidingPiece

  def initialize(board, position, name, color)
    super(board, position, "Test Rook", color)
  end




end
