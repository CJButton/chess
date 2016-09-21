
require_relative 'piece'
require 'byebug'

module SlidingPiece

  STRAIGHT = [[0, 1], [0, -1], [-1, 0], [1, 0]]
  DIAGS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

  def initialize(board, position, name, color)
    super(board, position, name, color)
  end

  def find_lines(diff_set)
    all_possible_pos = []

    diff_set.each_with_index do |diffs, dir_i|
      all_possible_pos << Array.new
      x, y = pos
      until x > 6 || x < 1 || y > 6 || y < 1
        i, j = diffs
        x = x + i
        y = y + j

        all_possible_pos[dir_i] << [x, y]
      end
    end
    all_possible_pos - [pos]
  end

  # def find_straight_lines(pos)
  #   all_possible_pos = []
  #
  #   STRAIGHT.each_with_index do |diffs, dir_i|
  #     all_possible_pos << Array.new
  #     x, y = pos
  #     until x > 6 || x < 1 || y > 6 || y < 1
  #       i, j = diffs
  #       x = x + i
  #       y = y + j
  #
  #       all_possible_pos[dir_i] << [x, y]
  #     end
  #   end
  #   all_possible_pos - [pos]
  # end
  #
  # def find_diagonal_lines(pos)
  #   all_possible_pos = []
  #   DIAGS.each_with_index do |diffs, dir_i|
  #     all_possible_pos << Array.new
  #
  #     x, y = pos
  #     until x > 6 || x < 1 || y > 6 || y < 1
  #       i, j = diffs
  #       x = x + i
  #       y = y + j
  #
  #       all_possible_pos[dir_i] << [x, y]
  #     end
  #   end
  #   all_possible_pos #- [pos]
  # end

  # def remove_blocked_path(arr)
  #   unblocked_moves =[]
  #   arr = [arr]
  #   idx1 = 0
  #   until idx1 == arr.length
  #
  #     idx2 = 0
  #     until idx2 == arr[idx1].length
  #       position = arr[idx1][idx2]
  #       if @board.board[position[0]][position[1]].is_a?(Piece)
  #         if @board.board[position[0]][position[1]].color != @color
  #           unblocked_moves += arr[idx1].take(idx2 + 1)
  #         else
  #           unblocked_moves += arr[idx1].take(idx2)
  #         end
  #       end
  #       idx2 += 1
  #     end
  #     idx1 += 1
  #   end
  #   unblocked_moves
  # end

  # # XXXXXXXXXXXX
  # all_possible_pos.each_with_index do |direction, dir_i|
  #   direction.each_with_index do |square, square_i|




  def moves
    #byebug
    # potential_moves = []
    # valid_moves = []
    # STRAIGHT.each do |diff|
    #   x, y = diff
    #   potential_moves << [x + position[0], y + position[1]]
    # end
    #
    # until potential_moves.empty?
    #   byebug
    #   x, y = potential_moves.shift
    #   tested_move = [grow_unblocked_moves_in_dir(x, y)]
    #   valid_moves += tested_move unless tested_move.nil?
    #   potential_moves += tested_move unless tested_move == [nil]
    # end
    # valid_moves

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
