class Game

  HAND_NAMES = ['high card', 'pair', 'two pair', 'three of a kind',
              'straight', 'flush', 'full house', 'four of a kind',
              'straight flush']

  def initialize(text_line)
    @players = []
    @winner = nil
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
    # IMPLEMENT
    # first compare rank; if same, compare cascading ids; if same, tie
    # return hash with keys tie, winning_card, rank, winner
  end

end