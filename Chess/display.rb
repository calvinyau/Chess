require 'colorize'
require_relative 'board'
require_relative 'cursor'
require 'byebug'

class Display
  attr_reader :cursor

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)

    @board = board
  end

  def render
    system("clear")

    cursor_x, cursor_y = @cursor.cursor_pos
    selected_x, selected_y = @cursor.selected_pos
    @cursor.selected ? move_set = @board[[selected_x, selected_y]].moves : move_set = []

    puts "   #{(0..7).to_a.join('  ')}"
    (0..7).each do |i|
      print "#{i} "
      (0..7).each do |j|
        if move_set.include?([i, j]) && @cursor.selected
          if move_set.include?(@cursor.cursor_pos) && [i, j] == @cursor.cursor_pos
            print " #{@board[[i, j]].symbol} ".colorize(background: :light_red)
          else
            print " #{@board[[i, j]].symbol} ".colorize(background: :light_black)
          end
        elsif i == cursor_x && j == cursor_y
          print " #{@board[[i, j]].symbol} ".colorize(background: :red)
        elsif (i.even? && j.even?) || (i.odd? && j.odd?)
          print " #{@board[[i, j]].symbol} ".colorize(background: :light_magenta)
        else
          print " #{@board[[i, j]].symbol} ".colorize(background: :magenta)
        end
      end
      puts
    end
  end

  def [](row, col)
    grid[row][col]
  end

  def []=(row, col, value)
    grid[row][col] = value
  end

end
