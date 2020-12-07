class Player
  attr_reader :name, :mark
  attr_accessor :moves

  def initialize(name, mark)
    @name = name
    @mark = mark
    @moves = []
  end

  private

  def valid_name?(name)
    !!name.match(/[a-zA-Z]/)
  end

  def not_similar?(a, b)
    a == b
  end
end
