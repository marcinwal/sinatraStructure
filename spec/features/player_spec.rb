require './app/lib/player'

describe 'player options' do 
  let(:player){Player.new}
  let(:card){double :card,:rank=>2,:color=>2}
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

end