module TicTacToe
  class Player
    attr_reader :symbol, :name

    def initialize(symbol, name = nil)
      @symbol = symbol
      @name = name || "Player #{symbol}"
    end

    def to_s
      @name
    end

    def ==(other)
      other.is_a?(Player) && @symbol == other.symbol
    end

    def eql?(other)
      self == other
    end

    def hash
      @symbol.hash
    end
  end
end