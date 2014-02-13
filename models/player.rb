class Player

  attr_accessor :rank
  attr_reader :name, :hand

  VALUES_TO_NUMBERS = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                       '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10,
                       'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14}

  def initialize(args)
    @name = args[:name]
    @hand = args[:hand]
    @rank = determine_hand_value
  end

  def to_s
    self.name
  end

  private

  def determine_hand_value
    is_flush = determine_whether_flush
    is_straight = determine_whether_straight
    num_same = determine_num_same
  end

  def determine_whether_flush
    (self.hand[0].suit == self.hand[1].suit == self.hand[2].suit ==
     self.hand[3].suit == self.hand[4].suit)
  end

  def determine_whether_straight
  end

  def determine_num_same
  end

end