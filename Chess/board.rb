require_relative 'Pieces/piece'
require_relative 'Pieces/null_piece'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    self.populate_start
  end

  def place_rooks
    white = [[0, 0], [0, 7]]
    black = [[7, 7 ], [7, 0]]
    white.each { |pos| self[pos] = Rook.new(:white, pos, self) }
    black.each { |pos| self[pos] = Rook.new(:black, pos, self) }
  end

  def place_kings
    @white_king = King.new(:white, [0, 4], self)
    @black_king = King.new(:black, [7, 3], self)
    self[[0,4]] = @white_king
    self[[7, 3]] = @black_king
  end

  def place_queens
    self[[0,3]] = Queen.new(:white, [0, 3], self)
    self[[7,4]] = Queen.new(:black, [7, 4], self)
  end

  def place_knights
    white = [[0, 1], [0, 6]]
    black = [[7, 1], [7, 6]]
    white.each { |pos| self[pos] = Knight.new(:white, pos, self) }
    black.each { |pos| self[pos] = Knight.new(:black, pos, self) }
  end

  def place_bishops
    white = [[0, 2], [0, 5]]
    black = [[7, 2], [7, 5]]
    white.each { |pos| self[pos] = Bishop.new(:white, pos, self) }
    black.each { |pos| self[pos] = Bishop.new(:black, pos, self) }
  end

  def place_pawns
    (0..7).each do |x|
      @grid[1][x] = Pawn.new(:white, [1, x], self)
      @grid[6][x] = Pawn.new(:black, [6, x], self)
    end
  end

  def place_null_pieces
    (2..5).each do |y|
      (0..7).each do |x|
        self[[y, x]] = NullPiece.instance
      end
    end
  end

  def populate_start
    place_kings
    place_queens
    place_bishops
    place_knights
    place_rooks
    place_pawns
    place_null_pieces
  end


  def move_piece(start_pos, end_pos)
    raise "No piece at #{start_pos}." if self[start_pos].empty?
    if self.in_check?(:black)
      puts "IN CHECK"
    end
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = NullPiece.instance

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
  end

  def in_check?(color)
    if color == :white
      king_pos = @white_king.pos
      (0..7).each do |y|
        (0..7).each do |x|
          curr_piece = self[[y, x]]
          if curr_piece.color == :black
            if curr_piece.moves.include?(king_pos)
              return true
            end
          end
        end
      end
      return false
    elsif color == :black
      king_pos = @black_king.pos
      (0..7).each do |y|
        (0..7).each do |x|
          curr_piece = self[[y, x]]
          if curr_piece.color == :white
            if curr_piece.moves.include?(king_pos)
              return true
            end
          end
        end
      end
      return false
    end
  end

end
