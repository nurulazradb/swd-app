class Board
  attr_accessor :board_fields, :empty_fields
  attr_reader :size, :lines

  def initialize(size=3)
    @size = size
    @board_fields = {}
    @empty_fields = []
    @lines = []

    set_board
  end

  def mark(position, mark)
    if @empty_fields.include? position
      @board_fields[position] = " #{mark} "
      @empty_fields.delete(position)
    end
  end

  def winner?(mark)
    winner = []
    (1..@size).each {|m| winner << " #{mark} "}

    @lines.each do |line|
      _line = line.collect {|x| @board_fields[x]}
      return true if winner == _line
    end
    false
  end

  def tie?
    @empty_fields.empty?
  end

  def draw
    drawing = ''
    (0...@size).each do |row|
      fields = []
      separator = []
      num = row*@size
      (1..@size).each {|s| separator << '---'}
      drawing += separator.join('+') + "\n" if num > 0
      (1..@size).each {|c| fields << @board_fields[(num + c)]}
      drawing += fields.join('|') + "\n"
    end

    drawing
  end

  private

  def set_board_fields
    (1..@size**2).each {|p| @board_fields[p] = "   "; @empty_fields << p}
  end

  def set_lines
    # create for column
    columns = []
    (1..@size).each do |line|
      columns[line] = []
      (0...@size).each {|key| columns[line] << @size*key + line}
      @lines << columns[line]
    end

    # create for row
    rows = @lines.transpose
    rows.each {|r| @lines << r}

    # create for diagonal
    diagonals = []
    diagonals[1] = []
    diagonals[2] = []
    (0...@size).each do |key|
      diagonals[1] << @size*key + (key+1)
      diagonals[2] << @size*key + (@size-key)
    end
    @lines << diagonals[1]
    @lines << diagonals[2]
  end

  def set_board
    set_board_fields
    set_lines
  end
end
