class Player
  attr_reader :hands,:option
  def initialize
    @hands = []
    @hands[0] = Hand.new
    @option = ''
  end

  def addCard(card,hand = 0)
    @hands[hand].add(card)
    @option = 'hit'
  end

  def lost?
    return @hands[0].lost? unless @hands[1]
    return @hands[0].lost? && hands[1].lost?
  end

  def splitHand
    @hands[1] = Hand.new
    @hands[1].add(@hands[0].popCard)
    @hands[0].halfScore
    @hands[1].setScore(@hands[0].score)
    @option = 'split'
  end

end