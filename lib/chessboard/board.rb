module Chessboard
  class Board
    def initialize
      @pieces = {}
    end

    def put(file, rank, piece)
      @pieces[[file, rank]] = piece
    end

    def at(file, rank)
      @pieces[[file, rank]]
    end
  end
end
