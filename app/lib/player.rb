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

  def isSplittingAllowed
    return false if @hands.length > 1
    return @hands[0].isSplittingAllowed
  end

  def stand(hand = 0)
    @option = 'stand'+hand.to_s
  end
  #changing the logic in game for
  #two hands
  def score(hand = 0)
    return @hands[hand].score if @hands[hand]
  end

  def handsToArrayOfString
    return [@hands[0].toArrayOfStrings,@hands[1].handsToArrayOfStrings] if @hands[1]
    return @hands[0].toArrayOfStrings
  end

  def hasTwoHands
    return true if @hands[1]
    return false
  end

  def isHandFinished(hand)
    return true if hand == 0 and @option == 'stand0'
    return true if hand == 1 and @option == 'stand1'
    return @hands[hand].lost?
  end


end