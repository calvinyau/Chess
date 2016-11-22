require_relative 'stepable'

class King < Piece
  include Stepable
  DELTA = [[-1, 1], [0,1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0]].freeze

  def initialize(color, pos, board)
    @symbol = "\u265A".colorize(color)
    super
  end

end
