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
    @display.system_message = "Choose your first position."
    @display.cursor.confirmed_position = nil
    @display.render_loop
    start_pos = @display.cursor.confirmed_position

    @display.system_message = "Choose your second position."
    @display.cursor.confirmed_position = nil
    @display.render_loop
    end_pos = @display.cursor.confirmed_position
    
    @display.cursor.confirmed_position = nil
    @display.system_message = "Trying to move."
    @display.render_loop
    @board.move(start_pos,end_pos)

    @display.render_loop

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
