# coding: utf-8
require 'spec_helper'

module Chessboard
  describe Rook do
    it "can be constructed with a color" do
      Rook.new(:white).should be_white
      Rook.new(:black).should be_black

      Rook.white.should be_white
      Rook.black.should be_black
    end

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

    it "is blocked by allied pieces" do
      expect_allowed_moves <<-END
        ┌───┬───┬───┬───┬───┬───┬───┬───┐
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │ ♖ │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │ ♖ │( )│[♖]│( )│ ♖ │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │ ♖ │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
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
