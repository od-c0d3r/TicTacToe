require_relative 'player'
require_relative 'board'

class Game
  attr_reader :turn_flag, :game_finished

  def initialize
    @new_board = Board.new
    @turn_flag = false
    @game_finished = false
  end

  def welcome
    @new_board.welcome_borad
  end

  def create_player(name, mark)
    Player.new(name, mark)
  end

  def instructions(player1, player2)
    "\n#--------------------------------------#\n\n#{player1.name} choose \'#{player1.mark}\'\n#{player2.name} choose \'#{player2.mark}\'\n\nType your Desired position at your turn"
  end

  def valid_name?(a, b = '')
    a != b && !a.match(/\d/) && !b.match(/\d/)
  end

  def vaild_mark?(input)
    !!input.match(/\AX\z|\AO\z/)
  end

  def toggle_players(player1, player2)
    @turn_flag = toggle_turn(turn_flag)
    @turn_flag == true ? player1.name : player2.name
  end

  def whos_turn?(player1, player2)
    @turn_flag == true ? player1 : player2
  end

  def check_input(input)
    if valid_input?(input) && unique_input?(input)
      true
    else
      false
    end
  end

  def game_board
    @new_board.display_board
  end

  def store_input(input, player)
    player.moves << input
  end

  def update_board(input, player)
    @new_board.update_board(input, player.mark)
  end

  def game_draw?
    if @new_board.moves.length >= 9
      @game_finished = true
      'Game Tie!'
    end
  end

  def game_winner?(player)
    [123, 147, 456, 789, 369, 159, 357, 258].each do |i|
      if player.moves.sort.join.match(/#{i}/)
        @game_finished = true
        return "#{player.name} is the Winner!"
      end
    end
    nil
  end

  private

  def toggle_turn(turn_flag)
    !turn_flag
  end

  def valid_input?(input)
    input.to_s.match(/\A[1-9]\z/)
  end

  def unique_input?(input)
    if @new_board.moves.include?(input)
      false
    else
      true
    end
  end
end
