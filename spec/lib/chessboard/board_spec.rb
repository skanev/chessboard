require 'spec_helper'

module Chessboard
  describe Board do
    it "allows access to the squares through methods" do
      board = Board.new
      board.put Square.new('e4'), :white_king

      board.e4.should eq :white_king
      board.e5.should be_nil
    end
  end
end
