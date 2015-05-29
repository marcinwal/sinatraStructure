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

end