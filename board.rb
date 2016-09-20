
require_relative "null"
require "byebug"
class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8)}
    populate
  end

  def populate
    board.each_with_index do |row, row_i|
      row.each_with_index do |square, square_i|
        board[row_i][square_i] = NullPiece.instance
      end
    end
  end

  def move(start, end_pos)
    if start.nil?
      raise "Please enter a valid starting value."
    end

    #TODO: Raise error if end_pos is invalid
    start_piece = board[start]
    end_position = board[end_pos]

    start_piece, end_position = end_position, start_piece

  end

  def in_bounds

  end


  def [](pos)
    x, y = pos
    board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    board[x][y] = value
  end

end
