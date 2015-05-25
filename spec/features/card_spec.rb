require_relative '../../app/lib/card'

feature 'card' do 
  scenario "can have a card" do 
    card = Card.new('h',2)
    expect(card.rank).to eq 2
  end

  scenario "two card with same rank should be equal" do 
    card1 = Card.new('h',2)
    card2 = Card.new('c',2)
    expect(card1.isRankEqual(card2)).to be true
  end
end