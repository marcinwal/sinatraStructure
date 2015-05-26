require 'helpers/helpers.rb'
require './app/lib/deck'
# require 'byebug'

describe Deck do

  let(:deck){Deck.new}
  let(:deck2){Deck.new}


  it "should have 52 cards" do 
    expect(deck.count).to eq(52)
    expect(deck.deck.length).to eq(52)
  end

  it "should be able to shuffle the deck" do 
    deck.shuffle
    expect(Helpers.compare(deck,deck2)).to be false
    # byebug
  end

  it 'should give a card' do 
    card = deck2.giveACard
    expect(card.toString).to eq 'sk'
  end

  it 'should know how many cards left' do 
    card = deck2.giveACard
    expect(deck2.howManyCards).to eq(51)
  end

  it 'should know if cards are left' do 
    expect(deck.hasCards).to be true
  end
end