require_relative 'slideable'

class Rook < Piece
  include Slideable

  # DELTA = [[0, 1], [1, 0], [0, -1], [-1, 0]].freeze

  def initialize(color, pos, board)
    @symbol = "\u265C".colorize(color)
    @delta = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    super
  end

end
