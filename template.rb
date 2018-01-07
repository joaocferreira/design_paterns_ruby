class Match
  def start
    p 'Match started'
  end
  def finish
    p 'End'
  end
  def play
    start
    finish
  end
end

class Football < Match
  def start
    p 'Football match started'
  end
end

class Judo < Match
  def start
    p 'Judo game started'
  end
end

Match.new.play
Football.new.play
Judo.new.play
