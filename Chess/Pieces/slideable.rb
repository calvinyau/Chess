module Slideable

  def moves
    move_set = []

    @delta.each do |dir|
      curr_pos = @pos
      next_pos = increment_pos(curr_pos, dir)
      while on_board_move(next_pos) && @board[next_pos].empty?
        move_set << next_pos
        next_pos = increment_pos(next_pos, dir)
      end
      if on_board_move(next_pos) && @board[next_pos].color != self.color
        move_set << next_pos
      end
    end
    move_set
  end

  def increment_pos(curr_pos, delta)
    new_x = curr_pos[0] + delta[0]
    new_y = curr_pos[1] + delta[1]
    [new_x, new_y]
  end

end
