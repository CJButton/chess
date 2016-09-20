
require_relative 'piece'
require 'byebug'

module SlidingPiece

  STRAIGHT = [[0, 1], [0, -1], [-1, 0], [1, 0]]
  DIAGS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

  def initialize(board, position, name, color)
    super(board, position, name, color)
  end

  def find_straight_lines(pos)
    x,y = pos
    all_possible_pos = []
    (0..7).each do |i|
      all_possible_pos << [x,i]
      all_possible_pos << [i,y]
    end

    all_possible_pos - [pos]
  end

  def moves
    #byebug
    potential_moves = []
    valid_moves = []
    STRAIGHT.each do |diff|
      x, y = diff
      potential_moves << [x + position[0], y + position[1]]
    end

    until potential_moves.empty?
      byebug
      x, y = potential_moves.shift
      tested_move = [grow_unblocked_moves_in_dir(x, y)]
      valid_moves += tested_move unless tested_move.nil?
      potential_moves += tested_move unless tested_move == [nil]
    end
    valid_moves

  end

  def move_dirs

  end

  def grow_unblocked_moves_in_dir(dx, dy)

    unless dx > 7 || dx < 0 || dy > 7 || dy < 0
      if @board.board[dx][dy].is_a?(NullPiece)
        return [dx,dy]
      elsif @board.board[dx][dy].is_a?(Piece)
        return [dx, dy] if board[dx, dy].color != self.color
        #TODO add return if the implicit return here doesn't work
      end
    end

    [nil]
  end

end
