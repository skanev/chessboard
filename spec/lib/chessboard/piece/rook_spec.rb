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
      board    = parse_board drawing
      allowed  = board.allowed_moves(board.selected_square)
      expected = board.marked_squares

      allowed.should =~ expected
    end
  end
end
