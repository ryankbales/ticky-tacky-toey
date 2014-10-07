# require 'pry'

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
outcome = "Choose Wisely"
status = false
puts "Do you want to be X or O"
human = gets.chomp.upcase
if human == 'X'
  machine = 'O'
else
  machine = 'X'
end

def make_grid(g, message)
  system 'clear'
  puts " #{g[1]} | #{g[2]} | #{g[3]} | "
  puts "-------------"
  puts " #{g[4]} | #{g[5]} | #{g[6]} | "
  puts "-------------"
  puts " #{g[7]} | #{g[8]} | #{g[9]} | "
  puts "*************"
  puts message
end

def there_is_a_win_or_draw?(current_set, player_1, player_2, outcome, result)
  current_set.each do |a|
    if a.uniq.length == 1 #If all items are the same
      if a.first == player_1
        outcome = "#{player_1.upcase} is the winner!"
        result = true
        return outcome, result
      else
        outcome = "#{player_2.upcase} is the winner!"
        result = true
        return outcome, result
      end
    end
  end
  #if there isn't a winner than we need to keep going or it's a draw
  #keep going?
  current_set.each do |a|
    if  (a.uniq.length > 1) && (a.all? {|spot| (spot.is_a? String) || (spot.is_a? Integer) })
      return outcome, result
    end
  end
  #then it must be a tie
  current_set.each do |a|
    if  (a.uniq.length > 1) && (a.all? {|spot| spot.is_a? String}) #if they aren't the same and all strings it's a tie
      outcome = "It's a draw!"
      result = true
      return outcome, result
    end
  end

end

while status == false
  make_grid(spots, outcome)
  puts "#{human}, mark your spot!(1-9)" # get human input
  spot = gets.chomp.to_i

  #assign to board and replace number in winning_set
  spots[spot] = human
  winning_sets = winning_sets.map { |i| i.map { |mark| (mark == spot) ? human : mark} }

  #do this again for computer, except for the selection part
  available_spots = spots.select { |k, v|  v.is_a?(Integer)  }
  available_spots_value = []
  available_spots.each do |k, v|
    available_spots_value << v
  end

  machine_choice = available_spots_value.shuffle.first

  #assign to board and replace number in winning_set
  spots[machine_choice] = machine
  winning_sets = winning_sets.map { |i| i.map { |mark| (mark == machine_choice) ? machine : mark} }

  set_result = there_is_a_win_or_draw?(winning_sets, human, machine, outcome, status)
  outcome = set_result[0]
  status = set_result[1]
end
puts outcome #should only print win someone wins or there is a draw
