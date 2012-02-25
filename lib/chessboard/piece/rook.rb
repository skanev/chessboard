module Chessboard
  class Rook
    def possible_moves(position)
      line(position, &:down) +
        line(position, &:up) +
        line(position, &:left) +
        line(position, &:right)
    end

    private

    def line(square, &block)
      squares = [square]
      squares << yield(squares.last) until squares.last.nil?
      squares[1...-1]
    end
  end
end
