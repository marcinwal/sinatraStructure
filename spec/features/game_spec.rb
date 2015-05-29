require './app/lib/game'
require './app/lib/player'


describe 'the game' do 
  let(:game){Game.new}
  let(:player){Player.new}
  it 'should start the game with a player' do 
    expect(game.players.length).to eq 0 
  end

  it 'should be able to add a player' do 
    game.addPlayer(player)
    expect(game.players.length).to eq 1 
  end

  it 'should initialize a dealer' do 
    game.initDealer
    expect(game.dealer.hands[0].cards.length).to eq 2
  end

  it 'should init the game' do 
    game.gameInit
    expect(game.dealer).not_to be nil
  end

  it 'should hit the player' do 
    game.addPlayer(player)
    game.gameInit
    game.hitPlayer(0,0)
    expect(game.players[0].hands[0].cards.length).to eq 3
  end

  it 'player can stand' do 
    game.addPlayer(player)
    game.gameInit
    game.standPlayer(0)
    expect(game.players[0].option).to eq 'stand0'
  end

  it 'player know when players are finished' do 
    game.addPlayer(player)
    game.gameInit
    expect(game.areAllPlayersFinished).to be false
    game.standPlayer(0)
    expect(game.areAllPlayersFinished).to be true
  end

  it 'dealer should play authomatically' do 
    game.addPlayer(player)
    game.gameInit
    game.standPlayer(0)
    game.playDealer
    expect(game.dealer.score).to be > 16   
  end

  it 'should know who is the winner' do 
    game.addPlayer(player)
    game.gameInit
    game.standPlayer(0)
    game.playDealer    
    winners = game.findWinners  
    print winners 
    print game.players[0].score
    print game.dealer.score
  end  

end