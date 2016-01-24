class Game
  attr_accessor :board, :current_player, :other_player

  def initialize(board, players)
    @board = board
    @current_player, @other_player = players
    @game_over = false
  end

  def first_moves
    [1, @board.size, @board.size*(@board.size-1)+1, @board.size*(@board.size-1)+@board.size]
  end

  def switch_player
    @current_player, @other_player = @other_player, @current_player
  end

  def game_over?
    @game_over
  end

  def show_board
    puts ""
    puts "[Tic Tac Toe]"
    puts @board.draw
  end

  def turn
    clr
    show_board
    if @current_player.is_a? AI
      ai_turn
    else
      puts "Player #{@current_player.name}, please enter a valid spot (#{@board.empty_fields.join(', ')}) to place your #{@current_player.marker}"
      choice = gets.chomp.to_i

      if @board.empty_fields.include? choice
        @board.mark choice, @current_player.marker
      else
        puts "Please try again!"
        turn
      end
    end

    result
    switch_player
    turn unless game_over?
  end

  def ai_turn
    if @board.empty_fields.length == @board.size ** 2
      choice = first_moves.sample if choice.nil?
    else
      choice = @current_player.move
    end

    @board.mark choice, @current_player.marker
  end

  def result
    clr
    if @board.winner? @current_player.marker
      show_board
      puts "Game Over! Winner is #{@current_player.name}"
      @game_over = true
    elsif @board.tie?
      show_board
      puts "Tie!"
      @game_over = true
    end
  end

  def run
    while !game_over?
      turn
    end
  end

  def clr
    puts "\e[H\e[2J"
  end
end
