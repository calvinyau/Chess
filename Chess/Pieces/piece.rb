class Piece
  attr_reader :symbol, :board, :delta, :color
  attr_accessor :pos

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s

  end

  def empty?
    return true if self == NullPiece.instance
    false
  end

  # def symbol
  #
  # end

  def valid_moves

  end

  def on_board_move(pos)
    x, y = pos
    return true if x.between?(0, 7) && y.between?(0, 7)
    false
  end

  private

  def move_into_check

  end
end
