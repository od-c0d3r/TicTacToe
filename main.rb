require_relative './lib/game'

new_game = Game.new
puts new_game.welcome

# Creating Players
print 'Player 1, Please enter your nickname: '
player1_name = gets.chomp.strip
until new_game.valid_name?(player1_name)
  print 'Error. Only alphabets are allowed : '
  player1_name = gets.chomp.strip
end
print "#{player1_name}, Please choose your mark (x/o): "
player1_mark = gets.chomp.strip.capitalize
until new_game.vaild_mark?(player1_mark)
  print 'Error. Please enter (x/o) : '
  player1_mark = gets.chomp.strip.capitalize
end
puts ''
player1 = new_game.create_player(player1_name, player1_mark)

print 'Player 2, Please enter your nickname: '
player2_name = gets.chomp.strip
until new_game.valid_name?(player1_name, player2_name)
  print 'Please enter different name  : '
  player2_name = gets.chomp.strip
end
puts ''
player2 = new_game.create_player(player2_name, player2_mark = player1_mark == 'X' ? 'O' : 'X')

# Instructions
puts new_game.instructions(player1, player2)
puts new_game.game_board

# Game
until new_game.game_finished
  print "#{new_game.toggle_players(player1, player2)} turn : "
  input = gets.chomp.to_i
  until new_game.check_input(input)
    print 'Please enter unreserved position from 1~9 : '
    input = gets.chomp.to_i
  end
  new_game.store_input(input, new_game.whos_turn?(player1, player2))
  new_game.update_board(input, new_game.whos_turn?(player1, player2))
  puts new_game.game_board
  puts new_game.game_draw?
  puts new_game.game_winner?(new_game.whos_turn?(player1, player2))
end
