require './app/lib/player'

describe 'player options' do 
  let(:player){Player.new}
  let(:card){double :card,:rank=>2,:color=>2}
  it 'should have one hand initially' do 
    expect(player.hands.length).to eq(1)
  end

  it 'should be able to add a card' do 
    player.addCard(card)
    expect(player.option).to eq('hit')
  end

end