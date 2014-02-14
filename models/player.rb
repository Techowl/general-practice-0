class Player

  attr_reader :name, :hand, :rank, :cascading_vals

  VALUES_TO_NUMBERS = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                       '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10,
                       'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14}

  def initialize(args)
    @name = args[:name]
    @hand = args[:hand]
    @rank, @cascading_vals = get_hand_rank_and_cascading_vals
  end

  def to_s
    self.name
  end

  private

  def get_hand_rank_and_cascading_vals
    is_flush = get_whether_flush
    is_straight = get_whether_straight
    breakdown_by_val, cascading_vals = process_card_values
    rank = 0 if breakdown_by_val == [1, 1, 1, 1, 1]
    rank = 1 if breakdown_by_val == [2, 1, 1, 1]
    rank = 2 if breakdown_by_val == [2, 2, 1]
    rank = 3 if breakdown_by_val == [3, 1, 1]
    rank = 4 if is_straight
    rank = 5 if is_flush
    rank = 6 if breakdown_by_val == [3, 2]
    rank = 7 if breakdown_by_val == [4, 1]
    rank = 8 if is_flush && is_straight
    return rank, cascading_vals
  end

  def get_whether_flush
    suit_of_first = self.hand[0].suit
    self.hand.all? { |card| card.suit == suit_of_first }
  end

  def get_whether_straight
    ordered_card_nums = get_values_as_sorted_nums
    is_straight = true
    last_num = ordered_card_nums.shift
    ordered_card_nums.each do |num|
      is_straight = false unless num == last_num + 1
      last_num = num
    end
    is_straight
  end

  def process_card_values
    cards_by_num = Hash.new(0)
    ordered_card_nums = get_values_as_sorted_nums
    ordered_card_nums.each do |num|
      cards_by_num[num] += 1
    end
    breakdown_by_val = cards_by_num.values.sort.reverse
    cascading_vals = #
    return breakdown_by_val, cascading_vals
  end

  def get_values_as_sorted_nums
    values_as_nums = self.hand.map { |card| VALUES_TO_NUMBERS[card.value] }
    values_as_nums.sort
  end

  def get_cascading_vals
  end

end