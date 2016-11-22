require_relative 'slideable'

class Rook < Piece
  include Slideable

  DELTA = [[0, 1], [1, 0], [0, -1], [-1, 0]].freeze

  def initialize(color, pos, board)
    @symbol = "\u265C".colorize(color)
    super
  end

end
