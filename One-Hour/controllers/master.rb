class Master

  def initialize(filename)
    @games = []
    parse(filename)
  end

  def play_all
    @games.each { |game| game.play }
  end

  private

  def parse(filename)
    file = File.new(filename, "r")
    text = file.read
    text.each_line { |line| @games << Game.new(line) }
    file.close
  end

end