require './app/lib/hand'

describe 'hand' do
  let(:hand){Hand.new}
  let(:card1){double :card1,:rank=>10}
  let(:card2){double :card2,:rank=>5}
  it 'should start with score of zero' do 
    expect(hand.cards.size).to eq 0
  end

  it 'should calculate the score' do 
    expect(hand.calcScore(card1)).to eq(10)
    expect(hand.calcScore(card2)).to eq(5)
  end

  it 'should be able to add a card' do 
    hand.add(card1)
    expect(hand.cards.length).to eq(1)
  end

  it 'should know if lost' do 
    expect(hand.lost?).to be false
  end
end