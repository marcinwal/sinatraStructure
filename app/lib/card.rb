class Card

  attr_reader :color,:rank

  def initialize(color,rank)
    @color,@rank = color,rank
  end

  def isRankEqual(card)
    return @rank == card.rank
  end
    
end