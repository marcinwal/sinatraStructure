require_relative './player'

class Dealer < Player

  def shouldTakeCard
    return @hands[0].score <=16 ? true : false
  end

  def isSplittingAllowed
    return false
  end
end 