# frozen_string_literal: true

module TicTacToe
  class Board
    BOARD_SIZE = 3
    EMPTY_CELL = nil
    PLAYER_X = 'X'
    PLAYER_O = 'O'

    WINNING_COMBINATIONS = [
      # Rows
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      # Columns
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      # Diagonals
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]],
    ].freeze

    def initialize
      @board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE, EMPTY_CELL) }
    end

    def display
      puts("\n")
      puts('   0   1   2')
      puts(' ╔═══╦═══╦═══╗')
      @board.each_with_index do |row, row_index|
        row_display = row.map { |cell| cell.nil? ? ' ' : cell }.join(' ║ ')
        puts("#{row_index}║ #{row_display} ║")
        puts(' ╠═══╬═══╬═══╣') if row_index < 2
      end
      puts(' ╚═══╩═══╩═══╝')
      puts("\n")
    end

    def update_board(player, move)
      row, col = move

      if valid_move?(row, col)
        @board[row][col] = player
        true
      else
        false
      end
    end

    def valid_move?(row, col)
      within_bounds?(row, col) && cell_empty?(row, col)
    end

    def winner?
      WINNING_COMBINATIONS.any? do |combination|
        values = combination.map { |row, col| @board[row][col] }
        values.all?(PLAYER_X) || values.all?(PLAYER_O)
      end
    end

    def winning_player
      WINNING_COMBINATIONS.each do |combination|
        values = combination.map { |row, col| @board[row][col] }
        return PLAYER_X if values.all?(PLAYER_X)
        return PLAYER_O if values.all?(PLAYER_O)
      end
      nil
    end

    def full?
      @board.flatten.none?(EMPTY_CELL)
    end

    def empty?
      @board.flatten.all?(EMPTY_CELL)
    end

    def move_count
      @board.flatten.count { |cell| cell != EMPTY_CELL }
    end

    private

    def within_bounds?(row, col)
      row.between?(0, BOARD_SIZE - 1) && col.between?(0, BOARD_SIZE - 1)
    end

    def cell_empty?(row, col)
      @board[row][col] == EMPTY_CELL
    end
  end
end
