class Player

  attr_accessor :rank
  attr_reader :name, :hand

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
    # there has to be a much cleaner way to do this, which I will look for next; can't simply
    # iterate through an array of functions as one could in Python, though
    rank_found, rank = check_for_straight_flush
    return rank if rank_found
    rank_found, rank = check_for_four_of_a_kind
    return rank if rank_found
    rank_found, rank = check_for_full_house
    return rank if rank_found
    rank_found, rank = check_for_flush
    return rank if rank_found
    rank_found, rank = check_for_straight
    return rank if rank_found
    rank_found, rank = check_for_three_of_a_kind
    return rank if rank_found
    rank_found, rank = check_for_two_pair
    return rank if rank_found
    rank_found, rank = check_for_pair
    return rank if rank_found
    rank = get_high_card
    return rank
  end

end