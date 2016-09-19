require_relative "board"
require "colorize"
require_relative "cursor"


class Display
  def initialize(board)
    @board = board.board
    @cursor = Cursor.new([0,0], board)
  end

  def move(new_pos)
    # not sure what this does yet
  end

  def render
    puts "_____________________________________"

    @board.each_with_index do |row, row_index|
      row.each_with_index do |piece, piece_index|
        rendered_piece = "| #{piece[0].name} |"
        if @cursor.cursor_pos == [row_index, piece_index]
          rendered_piece = rendered_piece.colorize(:background => :blue)
        elsif row_index.even? && piece_index.even?
          rendered_piece = rendered_piece.colorize(:color => :white, :background => :black)
        elsif row_index.odd? && piece_index.odd?
          rendered_piece = rendered_piece.colorize(:color => :white, :background => :black)
        end

        print rendered_piece

      end

      print "\n"
    end
    nil
  end


  def render_loop
    loop do
      render
      @cursor.get_input
      system("clear")
    end
  end

end
