require 'spec_helper'

module Chessboard
  describe Rook do
    it "can move horizontally" do
      board = Board.new
      board.put Square.new('e4'), Rook.new

      board.should be_allowing_move(Square.new('e4'), Square.new('e3'))
    end
  end
end
