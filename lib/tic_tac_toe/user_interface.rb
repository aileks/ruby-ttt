module TicTacToe
  class UserInterface
    def self.welcome_message
      puts('Welcome to Tic Tac Toe!')
    end

    def self.get_player_move(current_player)
      puts("#{current_player}'s turn. Enter your move (row,column):")
      input = gets
      return 'exit' if input.nil?
      
      input.chomp
    end

    def self.invalid_input_message
      puts('Invalid input. Please enter row and column as numbers separated by a comma (e.g., 1,2).')
    end

    def self.invalid_move_message
      puts('Invalid move. Try again.')
    end

    def self.winner_message(player)
      puts("#{player} wins!")
    end

    def self.draw_message
      puts("It's a draw!")
    end
  end
end
