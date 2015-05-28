require './app/lib/player'

describe 'player options' do 
  let(:player){Player.new}
  let(:card){double :card,:rank=>2,:color=>2,
      :isRankEqual=>true,:toString=>'h2'}
  let(:card2){double :card2,:rank=>2,:color=>2}
  it 'should have one hand initially' do 
    expect(player.hands.length).to eq(1)
  end

  it 'should be able to add a card' do 
    player.addCard(card)
    expect(player.option).to eq('hit')
  end

  it 'should be able to tell if lost' do 
    expect(player.lost?).to be false
  end

  it 'should be able to split hands' do
    player.addCard(card)
    player.addCard(card2) 
    player.splitHand
    expect(player.hands.length).to eq 2
    expect(player.option).to eq 'split'
  end

  it 'should tell if splitting is allowed' do 
    player.addCard(card)
    player.addCard(card2) 
    expect(player.isSplittingAllowed).to be true
  end

  it 'should be possible to stand' do 
    player.stand
    expect(player.option).to eq 'stand0'
  end 

  it 'should calc the score' do 
    expect(player.score).to eq 0 
    player.addCard(card)
    expect(player.score).to eq 2
  end

  it 'should convert hands to string' do 
    player.addCard(card)
    expect(player.handsToArrayOfString).to eq ['h2']
  end

  it 'should know how many hands' do 
    player.addCard(card)
    player.addCard(card2)
    expect(player.hasTwoHands).to be false
    player.splitHand
    expect(player.hasTwoHands).to be true
  end

  it 'should know if a hand is finished' do 
    player.addCard(card)
    player.stand
    expect(player.isHandFinished(0)).to be true
  end

end