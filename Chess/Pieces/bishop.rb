require_relative 'slideable'

class Bishop < Piece
  include Slideable
  DELTA = [[-1, -1], [1, -1], [1, 1], [-1, 1]].freeze

  def initialize(color, pos, board)
    @symbol = "\u265D".colorize(color)
    super
  end

end
