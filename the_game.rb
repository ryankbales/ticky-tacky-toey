require 'pry'
#create board
#introduce the game
#assign x or o to respective player
#ask player for input
#assing input to board
#get computer input
#assign input to board
#checks for winner
#if no winner ask for input again
#if there is a winner or the board is full announce outcome

def grid
  g = {}
  (1..9).each {|pos| g[pos] = " "}
  g
end

def make_grid(g)
  system 'clear'
  puts " #{g[1]} | #{g[2]} | #{g[3]} | "
  puts "-------------"
  puts " #{g[4]} | #{g[5]} | #{g[6]} | "
  puts "-------------"
  puts " #{g[7]} | #{g[8]} | #{g[9]} | "
end

def pick_your_marker

end

def x_marks_spot(x)
  puts "X, mark your spot(1-9)"
  spot = gets.chomp.to_i
  x[spot] = "X"
end

spots = grid

make_grid(spots)
