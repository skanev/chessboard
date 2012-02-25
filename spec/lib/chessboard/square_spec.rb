require 'spec_helper'

module Chessboard
  describe Square do
    it "represents a valid chess square" do
      e4.name.should eq 'e4'
    end

    it "raises an error when constructed with an invalid square" do
      %w[a9 i3 a0 4e ee4 44 E4].each do |name|
        expect { Square.new(name) }.to raise_error(ArgumentError), "Expected '#{name}' to be an invalid square name"
      end
    end

    it "implements equality" do
      e4.should eq e4

      e4.should_not eq e5
    end

    it "can be used as a hash key" do
      {e4 => :knight}[e4].should eq :knight
    end

    it "has a nice string representation" do
      e4.to_s.should eq 'e4'
      e4.inspect.should eq 'e4'
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

    describe "(adjancent)" do
      it "can find out the square on the left" do
        e4.left.should eq d4
      end

      it "can find out the square on the right" do
        e4.right.should eq f4
      end

      it "can find out the square above" do
        e4.up.should eq e5
      end

      it "can find out the square below" do
        e4.down.should eq e3
      end

      it "returns nil if the square does not exist" do
        a1.down.should be_nil
        a1.left.should be_nil
        h8.up.should be_nil
        h8.right.should be_nil
      end
    end

    def method_missing(name, *args, &block)
      if name =~ /\A[a-h][1-8]\Z/
        Square.new(name.to_s)
      else
        super
      end
    end
  end
end
