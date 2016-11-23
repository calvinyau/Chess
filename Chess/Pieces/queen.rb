require_relative 'slideable'

class Queen < Piece
  include Slideable

  # DELTA = [[-1, 1], [0, 1], [1, 1], [1, 0],
          #  [1, -1], [0, -1], [-1, -1], [-1, 0]].freeze

  def initialize(color, pos, board)
    @symbol = "\u265B".colorize(color)
    @delta = [[-1, 1], [0, 1], [1, 1], [1, 0],
             [1, -1], [0, -1], [-1, -1], [-1, 0]]
    super
  end

end
