require_relative 'stepable'

class Knight < Piece
  include Stepable
  DELTA = [[1,2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, -1], [-2, -1]].freeze

  def initialize(color, pos, board)
    @symbol = "\u265E".colorize(color)
    super
  end
end
