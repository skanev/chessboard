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

      class AnnotatedBoard < BasicObject
        attr_reader :marked_squares
        attr_accessor :selected_square

        def initialize
          @board          = Board.new
          @marked_squares = []
        end

        def method_missing(name, *args, &block)
          @board.send name, *args, &block
        end
      end

      def parse_board(text)
        raise 'Malformed board' unless text =~ /\A
          (\s+)┌───┬───┬───┬───┬───┬───┬───┬───┐\n
          (
            \1(│[\[( ][ #{PIECE_NAMES.keys.join('')}][\]) ]){8}│\n
            \1├───┼───┼───┼───┼───┼───┼───┼───┤\n
          ){7}
          \1(│[\[( ][ #{PIECE_NAMES.keys.join('')}][\]) ]){8}│\n
          \1└───┴───┴───┴───┴───┴───┴───┴───┘\n?
        \Z/xu

        board     = AnnotatedBoard.new
        positions = 8.downto(1).to_a.product('a'.upto('h').to_a)

        positions.zip(text.scan(/│(.)(.)./u)).each do |(file, rank), (marker, character)|
          square = Square.new("#{rank}#{file}")
          board.put square, PIECE_NAMES[character] if PIECE_NAMES.has_key? character
          board.selected_square = square if marker == '['
          board.marked_squares.push square if marker == '('
        end

        board
      end
    end
  end
end
