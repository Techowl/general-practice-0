class Card

  attr_reader :value, :suit

  def initialize(args)
    @value = args[:value]
    @suit = args[:suit]
  end

end