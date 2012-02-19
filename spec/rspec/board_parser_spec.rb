# coding: utf-8
require 'spec_helper'

module Chessboard
  describe SpecSupport::BoardParser do
    it "can parse graphical representation of a board" do
      board = parse_board <<-END
        ┌───┬───┬───┬───┬───┬───┬───┬───┐
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │ ♟ │ ♞ │ ♝ │ ♜ │ ♛ │ ♚ │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │ ♙ │ ♘ │ ♗ │ ♖ │ ♕ │ ♔ │   │   │
        └───┴───┴───┴───┴───┴───┴───┴───┘
      END

      board.at(Square.new('a1')).should eq :white_pawn
      board.at(Square.new('b1')).should eq :white_knight
      board.at(Square.new('c1')).should eq :white_bishop
      board.at(Square.new('d1')).should eq :white_rook
      board.at(Square.new('e1')).should eq :white_queen
      board.at(Square.new('f1')).should eq :white_king

      board.at(Square.new('a2')).should eq :black_pawn
      board.at(Square.new('b2')).should eq :black_knight
      board.at(Square.new('c2')).should eq :black_bishop
      board.at(Square.new('d2')).should eq :black_rook
      board.at(Square.new('e2')).should eq :black_queen
      board.at(Square.new('f2')).should eq :black_king
    end

    it "can parse graphical representation of a board" do
      board = parse_board <<-END
        ┌───┬───┬───┬───┬───┬───┬───┬───┐
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │( )│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │[♙]│   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        └───┴───┴───┴───┴───┴───┴───┴───┘
      END

      board.selected_square.should eq Square.new('e2')
      board.marked_squares.should =~ [Square.new('e3'), Square.new('e4')]
    end

    it "raises an error on malformed boards" do
      expect_invalid_board '---'

      expect_invalid_board <<-END
        ┌───┬───┬───┬───┬───┬───┬───┐
        │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │
        └───┴───┴───┴───┴───┴───┴───┘
      END

      expect_invalid_board <<-END
        ┌───┬───┬───┬───┬───┬───┬───┬───┐
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        └───┴───┴───┴───┴───┴───┴───┴───┘
      END

      expect_invalid_board <<-END
        ┌───┬───┬───┬───┬───┬───┬───┬───┐
        │ x │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        ├───┼───┼───┼───┼───┼───┼───┼───┤
        │   │   │   │   │   │   │   │   │
        └───┴───┴───┴───┴───┴───┴───┴───┘
      END
    end

    def expect_invalid_board(text)
      expect { parse_board text }.to raise_error('Malformed board')
    end
  end
end
