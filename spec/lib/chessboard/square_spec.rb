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
  end
end
