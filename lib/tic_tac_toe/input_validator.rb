module TicTacToe
  class InputValidator
    INPUT_PATTERN = /^\d+,\d+$/

    def self.valid_format?(input)
      return false if input.nil? || input.empty?
      
      input.match?(INPUT_PATTERN)
    end

    def self.parse_coordinates(input)
      raise ArgumentError, "Invalid input format" unless valid_format?(input)
      
      coordinates = input.split(',').map(&:to_i)
      validate_coordinates(coordinates)
      coordinates
    end

    def self.validate_coordinates(coordinates)
      row, col = coordinates
      
      raise ArgumentError, "Coordinates must be between 0 and 2" unless valid_range?(row, col)
    end

    class << self
      private

      def valid_range?(row, col)
        row.between?(0, 2) && col.between?(0, 2)
      end
    end
  end
end