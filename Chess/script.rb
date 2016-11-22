load 'board.rb'
load 'display.rb'
load 'cursor.rb'
load 'Pieces/piece.rb'
load 'Pieces/knight.rb'
load 'Pieces/rook.rb'
load 'Pieces/bishop.rb'
load 'Pieces/queen.rb'
load 'Pieces/king.rb'
load 'Pieces/pawn.rb'
load 'Pieces/stepable.rb'
load 'Pieces/slideable.rb'

b = Board.new
d = Display.new(b)
# while true
#   d.cursor.get_input
#   d.render
# end

# king = King.new(:white, [0, 0], b)
d.render
b.move_piece([1, 1], [2, 1])
d.render
