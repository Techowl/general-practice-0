class Master

  def initialize(filename)
    @games = []
    parse(filename)
  end

  def play
  end

  private

  def parse(filename)
    file = File.new(filename, "r")
    text = file.read
    text.each_line.do |line|
      @games << Game.new(line)
    file.close
  end

end