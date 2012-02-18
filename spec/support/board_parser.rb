# coding: utf-8
module Chessboard
  module SpecSupport
    module BoardParser
      PIECE_NAMES = {
        '♟' => :black_pawn,
        '♞' => :black_knight,
        '♝' => :black_bishop,
        '♜' => :black_rook,
        '♛' => :black_queen,
        '♚' => :black_king,
        '♙' => :white_pawn,
        '♘' => :white_knight,
        '♗' => :white_bishop,
        '♖' => :white_rook,
        '♕' => :white_queen,
        '♔' => :white_king,
      }

      def parse_board(text)
        raise 'Malformed board' unless text =~ /\A
          (\s+)┌───┬───┬───┬───┬───┬───┬───┬───┐\n
          (
            \1(│[ ][ #{PIECE_NAMES.keys.join('')}][ ]){8}│\n
            \1├───┼───┼───┼───┼───┼───┼───┼───┤\n
          ){7}
          \1(│[ ][ #{PIECE_NAMES.keys.join('')}][ ]){8}│\n
          \1└───┴───┴───┴───┴───┴───┴───┴───┘\n?
        \Z/xu

        board = Board.new

        text.
          scan(/│ (.) /u).
          map(&:first).
          zip([7, 6, 5, 4, 3, 2, 1, 0].product([0, 1, 2, 3, 4, 5, 6, 7])).
          reject { |position, character| PIECE_NAMES.has_key? character }.
          each { |character, (file, rank)| board.put file, rank, PIECE_NAMES[character] }

        board
      end
    end
  end
end
