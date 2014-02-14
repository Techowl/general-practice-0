class View

# integrate winning card

  def self.output(args)
    if args[:tie]
      puts "Tie."
    elsif [:winning_card]
      puts "#{args[:winner]} wins. - with #{args[:rank]}: #{args[:winning_card]}"
    else
      puts "#{args[:winner]} wins. - with #{args[:rank]}"
    end
  end

end