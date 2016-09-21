require_relative 'display'
require_relative 'board'
require 'byebug'
#require_relative 'player'

class Chess
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    #@player1 = Player.new()
    #@player2 = Player.new()
  end

  def play
    until game_over?
    @display.render_loop
    start_pos = @cursor.confirmed_position

    @display.render_loop
    p start_pos
    end_pos = @cursor.confirmed_position

    if valid_move?
      move(start_pos, end_pos)
    end

    end
  end

  private
  def notify_players
  end

  def swap_turn!
  end

  def game_over?
    false
  end


end

if __FILE__ == $PROGRAM_NAME
  c = Chess.new
  c.play
end
