class AI < Player
  attr_accessor :game

  def initialize(name, marker)
    super(name, marker)
  end

  def move
    best_move = []
    choose = ''

    win_move[1].each {|m| best_move << m if block_move[1].include? m}

    if best_move.empty?
      if win_move.first >= block_move.first
        choose = win_move.last.sample
      else
        choose = block_move.last.sample
      end
    else
      choose = best_move.sample
    end
    choose = @game.board.empty_fields.sample if choose.nil?
    @game.board.mark choose, marker
  end

  def win_move
    wins = []
    turns = 0
    (1...@game.board.size).each do |counter|
      @game.board.lines.each do |line|
        temp_wins = []
        item = Array.new @game.board.size
        item = line.collect {|i| item[i] = @game.board.board_fields[i]}

        if item.count(" #{@marker} ") == counter && item.count("   ") == @game.board.size - counter
          line.each {|x| temp_wins << x if @game.board.empty_fields.include? x}
        end
        unless temp_wins.empty?
          wins = temp_wins
          turns = counter
        end
      end
    end

    return turns, wins
  end

  def block_move
    blocks = []
    turns = 0
    p2 = @game.other_player
    (1...@game.board.size).each do |counter|
      @game.board.lines.each do |line|
        temp_blocks = []
        item = Array.new @game.board.size
        item = line.collect {|i| item[i] = @game.board.board_fields[i]}

        if item.count(" #{p2.marker} ") == counter && item.count("   ") == @game.board.size - counter
          line.each {|x| temp_blocks << x if @game.board.empty_fields.include? x}
        end
        unless temp_blocks.empty?
          blocks = temp_blocks
          turns = counter
        end
      end
    end

    return turns, blocks
  end
end
