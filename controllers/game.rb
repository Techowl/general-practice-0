class Game

  def initialize(text_line)
    @players = []
    @tie = false
    @winner = nil
    @winning_rank = nil
    @winning_card_id = nil
    parse(text_line)
  end

  def play
    View.output(compare_hands)
  end

  private

  def parse(text_line)
    separate_players = text_line.split("  ")
    separate_players.each do |player|
      generate_player(player)
    end
  end

  def generate_player(text)
    name_and_cards = text.split(' ')
    name_with_colon = name_and_cards.shift
    name = name_with_colon[0..(name_with_colon.length - 2)]
    cards = name_and_cards.dup
    @players << Player.new(name: name, hand: generate_hand(cards))
  end

  def generate_hand(cards)
    cards.map { |card| generate_card(card) }
  end

  def generate_card(text)
    Card.new(value: text[0], suit: text[1])
  end

  def compare_hands
    player_1, player_2 = @players[0], @players[1]
    if player_1.rank > player_2.rank
      @winner, @winning_rank = player_1.name, player_1.rank
    elsif player_2.rank > player_1.rank
      @winner, @winning_rank = player_2.name, player_2.rank
    else
      compare_same_rank_hands(player_1, player_2)
    end
    {winner: @winner, rank: @winning_rank, tie: @tie, winning_card_id: @winning_card_id}
  end

  def compare_same_rank_hands(player_1, player_2)
    @winning_rank = player_1.rank
    if player_1.cascading_ids == player_2.cascading_ids
      @tie = true
    else
      iterate_over_cascading_ids(player_1, player_2)
    end
  end

  def iterate_over_cascading_ids(player_1, player_2)
    player_1.cascading_ids.each_with_index do |p1_id, index|
      p2_id = player_2.cascading_ids[index]
      if p1_id > p2_id
        @winner = player_1.name
        @winning_card_id = p1_id
        return
      elsif p2_id > p1_id
        @winner = player_2.name
        @winning_card_id = p2_id
        return
      end
    end
  end

end