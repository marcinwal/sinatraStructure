class Hand
  attr_reader :cards,:score
  def initialize
    @cards = []
    @score = 0
  end

  def calcScore(card)
    return 10 if card.rank >= 10
    return @score+11<=21? 11 : 1 if card.rank == 1 
    return card.rank
  end

  def add(card)
    @cards << card
    @score += calcScore(card)
  end

  def lost?
    @score > 21
  end
end