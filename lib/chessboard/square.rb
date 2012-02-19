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
  end
end
