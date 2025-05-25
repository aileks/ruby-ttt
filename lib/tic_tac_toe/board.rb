class Board
  def initialize
    @board = Array.new(3) { Array.new(3, nil) }
  end

  def display
    puts('Current Board:')
    @board.each do |row|
      row_display = row.map { |cell| cell.nil? ? '_' : cell }.join(' | ')
      puts(row_display)
      puts('-' * 9)
    end
  end
end
