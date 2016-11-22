require 'singleton'

class NullPiece < Piece
  include Singleton
  def initialize
    @symbol = " "
    @color = nil
  end
end
