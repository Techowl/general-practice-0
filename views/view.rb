class View

  HAND_NAMES = ['high card', 'pair', 'two pair', 'three of a kind',
              'straight', 'flush', 'full house', 'four of a kind',
              'straight flush']

  CARD_IDS_TO_VALUES = {1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
                        6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'Ten',
                        11 => 'Jack', 12 => 'Queen', 13 => 'King', 14 => 'Ace'}

  def self.output(args)
    if args[:tie]
      puts "Tie."
    elsif args[:winning_card_id]
      puts "#{args[:winner]} wins. - with #{HAND_NAMES[args[:rank]]}: " +
           "#{CARD_IDS_TO_VALUES[args[:winning_card_id]]}"
    else
      puts "#{args[:winner]} wins. - with #{HAND_NAMES[args[:rank]]}"
    end
  end

end