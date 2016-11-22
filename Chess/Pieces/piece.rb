class Piece
  attr_reader :symbol, :board
  attr_reader :pos

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s()

  end

  def empty?()
    #return equals NullPiece instance
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
    true
    false if x.outside?(0, 7) || y.outside?(0, 7)
  end

  private
  def move_into_check

  end
end
