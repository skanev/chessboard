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

    def left
      transform { |rank, file| [rank - 1, file] }
    end

    def right
      transform { |rank, file| [rank + 1, file] }
    end

    def up
      transform { |rank, file| [rank, file + 1] }
    end

    def down
      transform { |rank, file| [rank, file - 1] }
    end

    def up_left
      transform { |rank, file| [rank - 1, file + 1] }
    end

    def up_right
      transform { |rank, file| [rank + 1, file + 1] }
    end

    def down_left
      transform { |rank, file| [rank - 1, file - 1] }
    end

    def down_right
      transform { |rank, file| [rank + 1, file - 1] }
    end

    private

    def transform
      file, rank = yield @name[0].ord - ?a.ord, @name[1].ord - ?1.ord
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
