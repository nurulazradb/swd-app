require_relative 'tictactoe/board'
require_relative 'tictactoe/game'
require_relative 'tictactoe/player'
require_relative 'tictactoe/ai'

puts 'Select play mode:'
puts '1. 1 Player'
puts '2. 2 Players'
players = gets.chomp.to_i

if players == 1
  p1 = AI.new 'Computer', 'O'
  p2 = Player.new 'Human', 'X'
else
  p1 = Player.new 'Human #1', 'X'
  p2 = Player.new 'Human #2', 'O'
end

puts 'Select board type:'
puts '1. 3x3 board'
puts '2. 4x4 board'
puts '3. 5x5 board'

board = gets.chomp.to_i
case board
when 2
  board = 4
when 3
  board = 5
else
  board = 3
end

game = Game.new Board.new(board), [p1,p2]
p1.game = game if p1.is_a? AI
game.run
