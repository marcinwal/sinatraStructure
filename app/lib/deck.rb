class Deck
  attr_reader :count,:deck
  
  def initialize
    @count = 52
    @deck = []
    for color in (1..4) do 
      for rank in (1..13) do 
        deck << Card.new(color,rank)
      end
    end  
  end

  def shuffle
    for i in (0..51)
      choice = rand(51-i)
      @deck[i],@deck[choice] = @deck[choice],@deck[i]
    end
  end

  def giveACard
    if @count > 0
      @count -= 1
      return @deck.pop    
    else
      raise "All cards are gone1"
    end
  end

  def howManyCards
    return @count
  end

  def hasCards
    return @count > 0
  end

end