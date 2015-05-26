require_relative '../../app/lib/card'

feature 'card' do 
  # creating a double
  let(:deck){double :deck,:count_cards=>52}
  let(:card1){Card.new(1,2)}
  let(:card2){Card.new(2,2)}
  let(:card3){Card.new(3,12)}
  let(:card4){Card.new(4,11)}

  scenario "can have a card" do 
    card = Card.new(1,2)
    expect(card.rank).to eq 2
  end

  scenario "two card with same rank should be equal" do 
    expect(card1.isRankEqual(card2)).to be true
  end

  scenario "queen and king should be equal" do 
    expect(card3.isRankEqual(card4)).to be true    
  end

  scenario 'cards should be converted to strings' do 
    expect(card1.toString).to eq('c2')
    expect(card3.toString).to eq('hq')

  end

  scenario 'should have 52 cards in a deck' do 
    expect(deck.count_cards).to eq(52)
  end

end