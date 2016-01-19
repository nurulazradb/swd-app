class Game
  attr_accessor :board, :turn, :current_player, :other_player

  def initialize(board, players)
    @board = board
    @turn = 0
    @current_player, @other_player = players
  end

  def first_moves
    [1, @board.size, @board.size*(@board.size-1)+1, @board.size*(@board.size-1)+@board.size]
  end

  def switch_player
    @current_player, @other_player = @other_player, @current_player
  end
end
