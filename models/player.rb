class Player

  attr_reader :name, :hand

  def initialize(args)
    @name = args[:name]
    @hand = args[:hand]
  end

end