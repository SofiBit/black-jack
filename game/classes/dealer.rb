class Dealer < User
  include PointsCounter

  attr_accessor :choice
  attr_reader :name

  def initialize
    @name = 'Dealer'
    super(@name)
  end

  def add_card?
    return true if game_points(hand) < 17

    false
  end
end
