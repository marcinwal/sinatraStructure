class Game

  attr_reader :deck,:dealer,:players

  def initialize(numberOfPlayers = 1)
    @numberOfMaxPlayers = numberOfPlayers
    @deck = Deck.new
    @dealer = Dealer.new
    @players = []
  end

  def addPlayer(player)
    @players << Player.new if @players.length < @numberOfMaxPlayers
  end

  def initDealer
    card1 = @deck.giveACard
    card2 = @deck.giveACard
    @dealer.addCard(card1)
    @dealer.addCard(card2)
  end

  def gameInit
    @deck.shuffle
    initDealer
    for i in (0...@players.length) do 
      card1 = @deck.giveACard
      card2 = @deck.giveACard
      @players[i].addCard(card1)
      @players[i].addCard(card2)
    end
  end

  def hitPlayer(player,hand)
    if (!@players[player].lost? && @deck.hasCards)
      @players[player].addCard(@deck.giveACard,hand)
    end  
  end

  def splitPlayer(player)
    @players[player].splitHand if @players[player].isSplittingAllowed
  end

  def standPlayer(player)
    @players[player].stand
  end

  def areAllPlayersFinished
    @players.map{|player|  (player.option == 'stand0' || player.option == 'stand1' || player.lost?)? 1 : 0 }.
      reduce(0){|sum,el| sum + el} == @numberOfMaxPlayers
  end

  def playDealer
    while @dealer.shouldTakeCard  
      @dealer.addCard(@deck.giveACard)
    end
  end

  def findWinners
    results = @players.map{|player| (player.lost?)? 0 : player.score}
    maxScore = results.max
    ix = []
    for i in (0..results.length)
      ix << i+1 if results[i] == maxScore
    end  
    return [0] if (!@dealer.lost? && @dealer.score >= maxScore)
    return ix
  end

end