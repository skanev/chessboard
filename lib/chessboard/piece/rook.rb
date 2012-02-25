module Chessboard
  class Rook
    def initialize(color)
      @color = color
    end

    def possible_moves(position)
      line(position, &:down) +
        line(position, &:up) +
        line(position, &:left) +
        line(position, &:right)
    end

    def white?
      @color == :white
    end

    def black?
      @color == :black
    end

    private

    def line(square, &block)
      squares = [square]
      squares << yield(squares.last) until squares.last.nil?
      squares[1...-1]
    end

    class << self
      def white
        self.new :white
      end

      def black
        self.new :black
      end
    end
  end
end
