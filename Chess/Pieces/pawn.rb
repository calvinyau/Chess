class Pawn < Piece
  def initialize(color, pos, board)
    @symbol = "\u265F".colorize(color)
    super
  end
end
