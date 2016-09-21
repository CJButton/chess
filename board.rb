
require_relative "null"
require_relative "rook"
require_relative "knight"
require_relative "bishop"
require_relative "king"
require_relative "queen"
require_relative "piece"

require "byebug"
class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8)}
    populate_null
    populate_pieces
  end

  def populate_pieces
    @board[0][0] = Rook.new(board, [0, 0], "RK", :black)
    @board[0][1] = Knight.new(board, [0, 1], "KT", :black)
    @board[0][2] = Bishop.new(board, [0, 2], "BI", :black)
    @board[0][3] = Queen.new(board, [0, 3], "QN", :black)
    @board[0][4] = King.new(board, [0, 4], "KI", :black)
    @board[0][5] = Bishop.new(board, [0, 5], "BI", :black)
    @board[0][6] = Knight.new(board, [0, 6], "KT", :black)
    @board[0][7] = Rook.new(board, [0, 7], "RK", :black)

    @board[7][0] = Rook.new(board, [7, 0], "RK", :white)
    @board[7][1] = Knight.new(board, [7, 1], "KT", :white)
    @board[7][2] = Bishop.new(board, [7, 2], "BI", :white)
    @board[7][3] = Queen.new(board, [7, 3], "QN", :white)
    @board[7][4] = King.new(board, [7, 4], "KI", :white)
    @board[7][5] = Bishop.new(board, [7, 5], "BI", :white)
    @board[7][6] = Knight.new(board, [7, 6], "KT", :white)
    @board[7][7] = Rook.new(board, [7, 7], "RK", :white)




  end

  def populate_null
    board.each_with_index do |row, row_i|
      row.each_with_index do |square, square_i|
        board[row_i][square_i] = NullPiece.instance
      end
    end
  end

  def move(start, end_pos)
    x , y = start
    i , j = end_pos

    # if board[x][y].is_a?(NullPiece)
    #   raise "Please enter a valid starting value."
    # end

    #TODO: Raise error if end_pos is invalid
    start_piece = @board[x][y]
    end_position = @board[i][j]

    start_piece, end_position = end_position, start_piece

  end

  def in_bounds(pos)
    x, y = pos
    return false if x > 6 || x < 1 || y > 6 || y < 1
    true
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
