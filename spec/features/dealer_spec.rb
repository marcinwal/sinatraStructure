require './app/lib/dealer'

describe 'the dealer' do 
  let(:dealer){Dealer.new}

  it 'should know if to take a card' do 
    expect(dealer.shouldTakeCard).to be true
  end
end