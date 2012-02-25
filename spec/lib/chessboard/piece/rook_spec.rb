# coding: utf-8
require 'spec_helper'

module Chessboard
  describe Rook do
    it "can move horizontally and vertically" do
      expect_allowed_moves <<-END
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
    end

    def expect_allowed_moves(drawing)
      board = parse_board drawing

      board.marked_squares.each do |square|
        board.should be_allowing_move board.selected_square, square
      end
    end
  end
end
