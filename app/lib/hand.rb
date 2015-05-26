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

  def numOfCards
    @cards.length
  end

  def halfScore
    @score /= 2
  end

  def setScore(score)
    @score = score
  end

  def isSplittingAllowed
    return false if cards.length > 2
    return @cards[0].isRankEqual(@cards[1]) if cards.length == 2
    false
  end

  def popCard
    @cards.pop
  end

  def toArrayOfStrings
    return [] if @cards.length == 0
    return @cards.map{|card| card.toString}
  end
end