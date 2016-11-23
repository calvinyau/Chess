class Pawn < Piece
  def initialize(color, pos, board)
    @symbol = "\u265F".colorize(color)
    super
  end

  def moves
    @color == :white ? move_set = white_moves : move_set = black_moves


    # if on_board_move(new_pos) &&
    #   (@board[new_pos].empty? || @board[new_pos].color != self.color)
    #   move_set << new_pos
    # end
  end

  def white_moves
    move_set = []
    if @board.in_bounds?([@pos[0] + 1, @pos[1]]) &&
          @board[[@pos[0] + 1, @pos[1]]].empty?
      move_set << [@pos[0] + 1, @pos[1]]
    end

    if @pos[0] == 1
      move_set << [3, @pos[1]] if @board[[3, @pos[1]]].empty?
    end

    diag_diff = [[1, -1], [1, 1]]
    diag_diff.each do |diff|
      new_pos = [@pos[0] + diff[0], @pos[1] + diff[1]]
      if @board.in_bounds?(new_pos)
        unless @board[new_pos].empty? || @board[new_pos].color == self.color
          move_set << new_pos
        end
      end
    end

    move_set
  end

  def black_moves
    move_set = []
    if @board.in_bounds?([@pos[0] - 1, @pos[1]]) &&
          @board[[@pos[0] - 1, @pos[1]]].empty?
      move_set << [@pos[0] - 1, @pos[1]]
    end
    if @pos[0] == 6
      move_set << [4, @pos[1]] if @board[[4, @pos[1]]].empty?
    end

    diag_diff = [[-1, -1], [-1, 1]]
    diag_diff.each do |diff|
      new_pos = [@pos[0] + diff[0], @pos[1] + diff[1]]
      if @board.in_bounds?(new_pos)
        unless @board[new_pos].empty? || @board[new_pos].color == self.color
          move_set << new_pos
        end
      end
    end

    move_set
  end
end
