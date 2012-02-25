# coding: utf-8
require 'spec_helper'

module Chessboard
  describe Rook do
    it "can move horizontally and vertically" do
      board = parse_board <<-END
        ┌───┬───┬───┬───┬───┬───┬───┬───┐
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │( )│( )│( )│( )│[♖]│( )│( )│( )│
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        └───┴───┴───┴───┴───┴───┴───┴───┘
      END

      board.marked_squares.each do |square|
        board.should be_allowing_move board.selected_square, square
      end
    end
  end
end
