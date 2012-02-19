module Chessboard
  class Board
    def initialize
      @pieces = {}
    end

    def put(square, piece)
      @pieces[square] = piece
    end

    def at(square)
      @pieces[square]
    end
  end
end
