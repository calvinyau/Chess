load 'board.rb'
load 'display.rb'
load 'cursor.rb'
load 'piece.rb'

b = Board.new
d = Display.new(b)
while true
  d.cursor.get_input
  d.render
end
