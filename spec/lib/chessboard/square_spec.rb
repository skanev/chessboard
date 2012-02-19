require 'spec_helper'

module Chessboard
  describe Square do
    it "represents a valid chess square" do
      Square.new('e4').name.should eq 'e4'
    end

    it "raises an error when constructed with an invalid square" do
      %w[a9 i3 a0 4e ee4 44 E4].each do |name|
        expect { Square.new(name) }.to raise_error(ArgumentError), "Expected '#{name}' to be an invalid square name"
      end
    end

    it "implements equality" do
      Square.new('e4').should eq Square.new('e4')

      Square.new('e4').should_not eq Square.new('e5')
    end

    it "can be used as a hash key" do
      {Square.new('e4') => :knight}[Square.new('e4')].should eq :knight
    end

    it "has a nice string representation" do
      Square.new('e4').to_s.should eq 'e4'
      Square.new('e4').inspect.should eq 'e4'
    end

    it "can tell all squares" do
      Square.names.should eq %w[
        a8 b8 c8 d8 e8 f8 g8 h8
        a7 b7 c7 d7 e7 f7 g7 h7
        a6 b6 c6 d6 e6 f6 g6 h6
        a5 b5 c5 d5 e5 f5 g5 h5
        a4 b4 c4 d4 e4 f4 g4 h4
        a3 b3 c3 d3 e3 f3 g3 h3
        a2 b2 c2 d2 e2 f2 g2 h2
        a1 b1 c1 d1 e1 f1 g1 h1
      ]
    end
  end
end
