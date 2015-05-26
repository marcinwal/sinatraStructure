class Card
  @@rankCodes = 'jqk'
  @@suiteCodes = 'cdhs'

  attr_reader :color,:rank

  def initialize(color,rank)
    @color,@rank = color,rank
  end

  def isRankEqual(card)
    return [@rank,10].min == [card.rank,10].min
  end

  def toString
    rank = @rank > 10 ? @@rankCodes[@rank-11]: @rank 
    return @@suiteCodes[@color-1]+rank.to_s
  end
    
end