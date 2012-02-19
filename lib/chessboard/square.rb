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

    class << self
      def names
        %w[8 7 6 5 4 3 2 1].product(%w[a b c d e f g h]).map(&:reverse).map(&:join)
      end
    end
  end
end
