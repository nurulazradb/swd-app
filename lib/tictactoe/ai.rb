class AI < Player
  attr_accessor :game

  def initialize(name, marker)
    super(name, marker)
  end

  def move
    best_move = []
    choose = ''
    win_move.each {|m| best_move << m if block_move.include? m}

    if best_move.length == 0
      choose = win_move.sample
      choose = block_move.sample if choose.nil?
    else
      choose = best_move.sample
    end
    choose = @game.board.empty_fields.sample if choose.nil?
    @game.board.mark choose, marker
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
