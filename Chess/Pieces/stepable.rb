module Stepable

  def moves
    move_set = []
    DELTA.each do |dir|
      new_x = @pos[0] + dir[0]
      new_y = @pos[1] + dir[1]
      new_pos = [new_x, new_y]
      if on_board_move(new_pos) &&
        (@board[new_pos].empty? || @board[new_pos].color != self.color)
        move_set << new_pos
      end
    end
    move_set
  end
end
