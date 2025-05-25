require_relative 'board'
require_relative 'user_interface'
require_relative 'player'
require_relative 'input_validator'

module TicTacToe
  class Game
    def initialize
      @board = Board.new
      @player_x = Player.new('X', 'Player X')
      @player_o = Player.new('O', 'Player O')
      @current_player = @player_x
    end

    def start
      UserInterface.welcome_message
      @board.display

      loop do
        break if handle_turn == :exit
      end
    end

    private

    def handle_turn
      input = player_input
      return :exit if input.downcase == 'exit'

      if process_move(input)
        return :exit if check_game_end

        switch_player
      end

      :continue
    end

    def player_input
      UserInterface.get_player_move(@current_player.symbol)
    end

    def process_move(input)
      @move = InputValidator.parse_coordinates(input)
      make_move
    rescue ArgumentError
      UserInterface.invalid_input_message
      false
    end

    def check_game_end
      if winner?
        UserInterface.winner_message(@current_player.name)
        true
      elsif @board.full?
        UserInterface.draw_message
        true
      else
        false
      end
    end

    def make_move
      if @board.update_board(@current_player.symbol, @move)
        @board.display
        true
      else
        UserInterface.invalid_move_message
        false
      end
    end

    def switch_player
      @current_player = @current_player == @player_x ? @player_o : @player_x
    end

    def winner?
      @board.winner?
    end
  end
end
