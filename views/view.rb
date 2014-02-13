class View

  def self.output(args)
    if args[:tie]
      puts "Tie."
    else
      puts "#{args[:winner]} wins. - with #{args[:rank]}"
    end
  end

end