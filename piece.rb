

class Piece
  attr_reader :name, :board
  attr_accessor :position, :color

  def initialize(board, position, name, color)
    @board = board
    @position = position
    @name = name
    @color = color
  end

  def find_lines(diff_set)
    all_possible_pos = []

    diff_set.each_with_index do |diffs, dir_i|
      all_possible_pos << Array.new
      x, y = @position
      until x > 6 || x < 1 || y > 6 || y < 1
        i, j = diffs
        x = x + i
        y = y + j

        all_possible_pos[dir_i] << [x, y]
      end
    end
    all_possible_pos - [pos]
  end

  def filter_moves(arr)
    #TODO filter out impossible positions where the enemy is
    end_positions = []
    arr.each do |direction|
      direction.each do |move|
        end_positions << move if valid_moves?(move)
      end
    end
    end_positions
  end

  def valid_moves?(pos)
    dx, dy = pos

    unless dx > 7 || dx < 0 || dy > 7 || dy < 0
      if @board.board[dx][dy].is_a?(NullPiece)
        return true
      elsif @board.board[dx][dy].is_a?(Piece)
        return true if @board.board[dx][dy].color != self.color
        #TODO add return if the implicit return here doesn't work
      end
    end
    false
  end

  def moves

  end

end
