require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :cursor

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)

    @board = board
  end

  def render
    puts "   #{(0..7).to_a.join(" ")}"
    #  @board.grid.each_with_index do |row, idx|
    color_x, color_y = @cursor.cursor_pos

    (0..7).each do |i|
      print "#{i} "
      (0..7).each do |j|
        if i == color_x && j == color_y
          print " #{@board[[i, j]].value}".colorize(:red)
        else
          print " #{@board[[i, j]].value}"
        end
      end
      puts
      @board[@cursor.cursor_pos].value.colorize(color: :red)
    end

  end

  def [](row, col)
    grid[row][col]
  end

  def []=(row, col, value)
    grid[row][col] = value
  end

end
