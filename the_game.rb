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
  i = 1
  (1..9).each do |pos|
    g[pos] = i
    i += 1
  end
  g
end

winning_sets = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
puts "Let's play tic tac toe!"
spots = grid
human = ""
machine = ""
outcome = ""
status = false
puts "Do you want to be X or O"
human = gets.chomp.upcase
if human == 'X'
  machine = 'O'
else
  machine = 'X'
end

def make_grid(g)
  system 'clear'
  puts " #{g[1]} | #{g[2]} | #{g[3]} | "
  puts "-------------"
  puts " #{g[4]} | #{g[5]} | #{g[6]} | "
  puts "-------------"
  puts " #{g[7]} | #{g[8]} | #{g[9]} | "
end

def there_is_a_win_or_draw?(current_set, player_1, player_2, outcome, result)
  current_set.each do |a|
    if a.uniq.length == 1 #If all items are the same
      if a.first == player_1
        outcome = "#{player_1.upcase} is the winner!"
        result = true
      else
        outcome = "#{player_2.upcase} is the winner!"
        result = true
      end
    elsif  (a.uniq.length > 1) && (!a.include?(Integer)) #if they aren't the same it's a tie
      outcome = "It's a draw!"
      result = true
    else
      outcome = "Select again."
      result = false
    end
  end
end

while status == false
  make_grid(spots)
  puts "#{human}, mark your spot!(1-9)" # get human input
  spot = gets.chomp.to_i

  if (spots[spot] != "X") || (spots[spot] != "O")
    spots[spot] = human #assign to board and replace number in winning_set
    winning_sets.each do |i|
      i.each do |mark|
        if mark == spot
          mark = human
        end
      end
    end
  end

  #do this again for computer, except for the selection part
  available_spots = spots.select { |k, v|  v.is_a?(Integer)  }
  available_spots_value = []
  available_spots.each do |k, v|
    available_spots_value << v
  end

  machine_choice = available_spots_value.shuffle.first
  if (spots[machine_choice] != "X") || (spots[machine_choice] != "O")
    spots[machine_choice] = machine #assign to board and replace number in winning_set
    winning_sets.each do |i|
      i.each do |mark|
        if mark == machine_choice
          mark = machine
        end
      end
    end
  end

  there_is_a_win_or_draw?(winning_sets, human, machine, outcome, status)
  puts outcome
end
