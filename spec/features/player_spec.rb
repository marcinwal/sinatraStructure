require './app/lib/player'

describe 'player options' do 
  let(:player){Player.new}
  card(:card){double :card}
  it 'should have one hand initially' do 
    expect(player.hands.length).to eq(1)
  end


end