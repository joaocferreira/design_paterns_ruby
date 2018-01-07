class Match
  def initialize(sport)
    @sport = sport.new
  end
  def start
    @sport.start
  end
  def finish
    p 'End'
  end
  def play
    start
    finish
  end
end

class Football
  def start
    p 'Football match started'
  end
end

class Judo
  def start
    p 'Judo game started'
  end
end

Match.new(Football).play
Match.new(Judo).play
