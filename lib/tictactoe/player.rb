class Player
  attr_reader :marker, :name

  def initialize(name, marker)
    # @name = input.fetch(:name)
    # @marker = input.fetch(:marker)
    @name = name
    @marker = marker
  end
end
