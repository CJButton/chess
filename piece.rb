
#require_relative 'board'

class Piece
  attr_reader :name
  attr_accessor :position
  def initialize(board, position, name, color)
    @board = board
    @position = position
    @name = "p"
    @color = color
  end

  def valid_moves

  end

  def moves

  end

end
