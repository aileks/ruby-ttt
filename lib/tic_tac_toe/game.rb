require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @current_player = 'X'
  end

  def start
    puts('Welcome to Tic Tac Toe!')
    @board.display

    loop do
      puts("#{@current_player}'s turn. Enter your move (row,column):")
      input = gets.chomp

      break if input.downcase == 'exit'

      begin
        row, col = input.split(',').map(&:to_i)
        @move = [row, col]

        if make_move
          if winner?
            puts("#{@current_player} wins!")
            break
          elsif @board.full?
            puts("It's a draw!")
            break
          end

          switch_player
        end
      rescue StandardError
        puts('Invalid input. Please enter row and column as numbers separated by a comma (e.g., 1,2).')
      end
    end
  end

  def make_move
    if @board.update_board(@current_player, @move)
      @board.display
      true
    else
      puts('Invalid move. Try again.')
      false
    end
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def winner?
    @board.winning_state
  end
end
