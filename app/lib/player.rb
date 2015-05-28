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


end