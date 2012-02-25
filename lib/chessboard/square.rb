module Chessboard
  class Square
    attr_reader :name

    def initialize(name)
      raise ArgumentError, "Invalid square: #{name}" unless name =~ /\A[a-h][1-8]\Z/
      @name = name
    end

    def to_s
      name
    end

    def ==(other)
      @name == other.name
    end
    alias eql? ==

    def hash
      @name.hash
    end

    {
      left:       [-1,  0],
      right:      [ 1,  0],
      up:         [ 0,  1],
      down:       [ 0, -1],
      up_left:    [-1,  1],
      up_right:   [ 1,  1],
      down_left:  [-1, -1],
      down_right: [ 1, -1],
    }.each do |name, offset|
      define_method(name) do
        transform { |position| [position[0] + offset[0], position[1] + offset[1]] }
      end
    end

    private

    def transform
      file, rank = yield [@name[0].ord - ?a.ord, @name[1].ord - ?1.ord]
      position   = [file + ?a.ord, rank + ?1.ord].map(&:chr).join

      Square.new position if position =~ /\A[a-h][1-8]\Z/
    end

    class << self
      def names
        %w[8 7 6 5 4 3 2 1].product(%w[a b c d e f g h]).map(&:reverse).map(&:join)
      end
    end
  end
end
