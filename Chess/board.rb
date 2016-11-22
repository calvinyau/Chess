require_relative 'Pieces/piece'
require_relative 'Pieces/null_piece'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    self.populate_start
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at #{start_pos}." if self[start_pos].nil?
    raise "#{end_pos} already has a piece." unless self[end_pos].nil?
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def populate_start
    (0..1).each do |x|
      (0..7).each do |y|
        @grid[x][y] = Piece.new("P")
      end
    end

    (2..5).each do |x|
      (0..7).each do |y|
        @grid[x][y] = Piece.new("N")
      end
    end

    (6..7).each do |x|
      (0..7).each do |y|
        @grid[x][y] = Piece.new("P")
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def in_bounds?(pos)
    x, y = pos
    return false unless x.between?(0, 7)
    return false unless y.between?(0, 7)
    true
    # raise "X out of bounds." unless x.between?(0, 7)
    # raise "Y out of bounds." unless y.between?(0, 7)
  end
end
