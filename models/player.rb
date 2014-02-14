class Player

  attr_reader :name, :hand, :rank, :cascading_ids

  VALUES_TO_IDS = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                   '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10,
                   'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14}

  def initialize(args)
    @name = args[:name]
    @hand = args[:hand]
    @rank, @cascading_ids = get_hand_rank_and_cascading_ids
  end

  private

  def get_hand_rank_and_cascading_ids
    is_flush = get_whether_flush
    is_straight = get_whether_straight
    cascading_nums, cascading_ids = process_cards
    rank = 0 if cascading_nums == [1, 1, 1, 1, 1]
    rank = 1 if cascading_nums == [2, 1, 1, 1]
    rank = 2 if cascading_nums == [2, 2, 1]
    rank = 3 if cascading_nums == [3, 1, 1]
    rank = 4 if is_straight
    rank = 5 if is_flush
    rank = 6 if cascading_nums == [3, 2]
    rank = 7 if cascading_nums == [4, 1]
    rank = 8 if is_flush && is_straight
    return rank, cascading_ids
  end

  def get_whether_flush
    suit_of_first = self.hand[0].suit
    self.hand.all? { |card| card.suit == suit_of_first }
  end

  def get_whether_straight
    ordered_card_ids = get_values_as_sorted_ids
    is_straight = true
    last_id = ordered_card_ids.shift
    ordered_card_ids.each do |id|
      is_straight = false unless id == last_id + 1
      last_id = id
    end
    is_straight
  end

  def process_cards
    num_by_card_id = Hash.new(0)
    ordered_card_ids = get_values_as_sorted_ids
    ordered_card_ids.each do |id|
      num_by_card_id[id] += 1
    end
    cascading_nums, cascading_ids = organize_by_ids(num_by_card_id)
    return cascading_nums, cascading_ids
  end

  def organize_by_ids(num_by_card_id)
    ordered_id_num_pairs = get_ordered_id_num_pairs(num_by_card_id)
    cascading_nums = []
    cascading_ids = []
    ordered_id_num_pairs.each do |id, num|
      cascading_nums << num
      cascading_ids << id
    end
    return cascading_nums, cascading_ids
  end

  def get_ordered_id_num_pairs(num_by_card_id)
    id_num_pairs = []
    num_by_card_id.each { |id, num| id_num_pairs << [id, num] }
    id_num_pairs.sort_by! { |id, num| num + (id / 15.0) }.reverse
  end

  def get_values_as_sorted_ids
    values_as_ids = self.hand.map { |card| VALUES_TO_IDS[card.value] }
    values_as_ids.sort
  end

end