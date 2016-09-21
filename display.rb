require_relative "board"
require "colorize"
require_relative "cursor"
require 'byebug'


class Display
  attr_accessor :cursor, :system_message
  def initialize(board)
    @board = board.board
    @cursor = Cursor.new([0,0], board)
    @system_message = ""
  end

  def move(new_pos)
    # not sure what this does yet
  end

  def render
    blank_space = Array.new(8) {"     "}

    @board.each_with_index do |row, row_index|
      blank_space.each_with_index do |top_border, top_idx|
        rendered_top_border = "#{top_border}"

        if row_index.even? && top_idx.even?
          rendered_top_border = rendered_top_border.colorize(:color => :white, :background => :black)
        elsif row_index.odd? && top_idx.odd?
            rendered_top_border = rendered_top_border.colorize(:color => :white, :background => :black)
        end
        print rendered_top_border
      end

      print "\n"
      row.each_with_index do |piece, piece_index|
        rendered_piece = " #{piece.name} "
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

      blank_space.each_with_index do |bottom_border, bottom_idx|
        rendered_bottom_border = "#{bottom_border}"

        if row_index.even? && bottom_idx.even?
          rendered_bottom_border = rendered_bottom_border.colorize(:color => :white, :background => :black)

        elsif row_index.odd? && bottom_idx.odd?
            rendered_bottom_border = rendered_bottom_border.colorize(:color => :white, :background => :black)
        end
        print rendered_bottom_border
      end
      print "\n"

    end
    print @system_message
    nil
  end


  def render_loop
    #byebug
    until @cursor.confirmed_position != nil
      # loop do
        render
        @cursor.get_input
        system("clear")
      # end
    end
  end

end
