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

    def allowing_move?(from, to)
      @pieces[from].possible_moves(from).include? to
    end

    Square.names.each do |name|
      define_method(name) { at Square.new(name) }
    end
  end
end
