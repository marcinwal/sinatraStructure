require './app/lib/dealer'

describe 'the dealer' do 
  let(:dealer){Dealer.new}

  it 'should know if to take a card' do 
    expect(dealer.shouldTakeCard).to be true
  end

  it 'should not be allowed to split ' do 
    expect(dealer.isSplittingAllowed).to be false
  end
end