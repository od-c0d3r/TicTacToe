class Board
  attr_reader :moves

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @moves = []
  end

  def welcome_borad
    "\n\n#--------------------------------------#\n#                                      #\n#           TicTacTao v1.0             #\n#         (Terminal Version)           #\n#                                      #\n#          with <3 by Omar R.          #\n#         github.com/od-c0d3r          #\n#                                      #\n#--------------------------------------#\n\n## Rules :\n\n# The game is played on a grid that's 3 \nsquares by 3 squares.\n\n# Players take turns putting their \nPostions in command line.\n\n# The first player to get 3 of thier \nown marks in a row (up, down, across, \nor diagonally) is the winner.\n\n# When all 9 squares are full, the game \nis over. If no player has 3 marks in a \nrow, the game ends in a tie.\n\n#--------------------------------------#\n\n"
  end

  def display_board
    "\n#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}\n--+---+--\n#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}\n--+---+--\n#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end

  def update_board(input, mark)
    @moves.push(input)
    case input
    when 1
      @board[0][0] = mark
    when 2
      @board[0][1] = mark
    when 3
      @board[0][2] = mark
    when 4
      @board[1][0] = mark
    when 5
      @board[1][1] = mark
    when 6
      @board[1][2] = mark
    when 7
      @board[2][0] = mark
    when 8
      @board[2][1] = mark
    when 9
      @board[2][2] = mark
    end
  end
end
