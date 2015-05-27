class Player
  attr_reader :hands,:option
  def initialize
    @hands = []
    @hands[0] = Hand.new
    @option = ''
  end
end