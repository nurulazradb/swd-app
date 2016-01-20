class AI < Player
  attr_accessor :game

  def initialize(name, marker)
    super(name, marker)
  end

  def move
    best_move = []
    win_move.each {|m| best_move << m if block_move.include? m}

    if best_move.nil?
      @game.board.mark @game.board.empty_fields.sample, marker
    else
      @game.board.mark best_move.sample, marker
    end
  end

  def win_move
    wins = []
    (1...@game.board.size).each do |counter|
      @game.board.lines.each do |line|
        item = Array.new @game.board.size
        item = line.collect {|i| item[i] = @game.board.board_fields[i]}

        if item.count(" #{@marker} ") == counter && item.count("   ") == @game.board.size - counter
          line.each {|x| wins << x if @game.board.empty_fields.include? x}
        end
      end
    end

    wins
  end

  def block_move
    blocks = []
    p2 = @game.other_player
    (1...@game.board.size).each do |counter|
      @game.board.lines.each do |line|
        item = Array.new @game.board.size
        item = line.collect {|i| item[i] = @game.board.board_fields[i]}

        if item.count(" #{p2.marker} ") == counter && item.count("   ") == @game.board.size - counter
          line.each {|x| blocks << x if @game.board.empty_fields.include? x}
        end
      end
    end

    blocks
  end
end
