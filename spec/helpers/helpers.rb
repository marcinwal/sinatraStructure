require './app/lib/deck'

module Helpers
  def Helpers.compare(deck1,deck2)
    for i in (0..deck1.deck.length)
      if(deck1.deck[i].color!=deck2.deck[i].color) || (deck1.deck[i].rank!=deck2.deck[i].rank)
        return false
      end
    end
    true
  end
end