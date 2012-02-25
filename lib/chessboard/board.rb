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

    def allowed_moves(square)
      @pieces[square].possible_moves(self, square)
    end

    Square.names.each do |name|
      define_method(name) { at Square.new(name) }
    end
  end
end
