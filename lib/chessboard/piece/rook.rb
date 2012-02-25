module Chessboard
  class Rook
    def initialize(color)
      @color = color
    end

    def possible_moves(board, position)
      line(board, position, &:down) +
        line(board, position, &:up) +
        line(board, position, &:left) +
        line(board, position, &:right)
    end

    def white?
      @color == :white
    end

    def black?
      @color == :black
    end

    private

    def line(board, square)
      squares = []
      square  = yield square

      until square.nil? or own? board.at(square)
        squares << square
        break if opponent? board.at(square)
        square = yield square
      end

      squares
    end

    def own?(piece)
      piece and
        ((white? and piece.white?) or
        (black? and piece.black?))
    end

    def opponent?(piece)
      piece and not own?(piece)
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
