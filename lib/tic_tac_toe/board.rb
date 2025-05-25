class Board
  def initialize
    @board = Array.new(3) { Array.new(3, nil) }
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
    row.between?(0, 2) && col.between?(0, 2) && @board[row][col].nil?
  end

  def winning_state
    winning_combinations = [
      [[0, 0], [0, 1], [0, 2]], # Row 1
      [[1, 0], [1, 1], [1, 2]], # Row 2
      [[2, 0], [2, 1], [2, 2]], # Row 3
      [[0, 0], [1, 0], [2, 0]], # Column 1
      [[0, 1], [1, 1], [2, 1]], # Column 2
      [[0, 2], [1, 2], [2, 2]], # Column 3
      [[0, 0], [1, 1], [2, 2]], # Left Downward Diagonal
      [[0, 2], [1, 1], [2, 0]], # Right Downward Diagonal
    ]

    winning_combinations.any? do |combination|
      values = combination.map { |row, col| @board[row][col] }
      values.all? { |val| val == 'X' } || values.all? { |val| val == 'O' }
    end
  end

  def full?
    @board.flatten.none?(&:nil?)
  end
end
