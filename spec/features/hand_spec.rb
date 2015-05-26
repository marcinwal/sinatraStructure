require './app/lib/hand'

describe 'hand' do
  let(:hand){Hand.new}
  let(:card1){double :card1,:rank=>10,:isRankEqual=>true}
  let(:card2){double :card2,:rank=>5,:isRankEqual=>false}
  let(:card3){double :card3,:rank=>10}
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

  it 'should know how many cards are in teh hand' do 
    hand.add(card1)
    hand.add(card2)
    expect(hand.numOfCards).to eq(2)
  end

  it 'should split the points' do 
    hand.add(card1)
    hand.add(card3)
    hand.halfScore
    expect(hand.score).to equal(10)
  end

  it 'should set a score' do 
    hand.setScore(20)
    expect(hand.score).to eq(20)
  end

  it 'should check if spliting is allowed' do 
    hand.add(card2)
    hand.add(card1)
    expect(hand.isSplittingAllowed).to be false
  end

  it 'should check if spliting is allowed' do 
    hand.add(card1)
    hand.add(card3)
    expect(hand.isSplittingAllowed).to be true
  end

  it 'should be able to pop a cards if split' do 
    hand.add(card1)
    hand.add(card3)
    expect(hand.popCard).to eq(card3)    
  end 
end