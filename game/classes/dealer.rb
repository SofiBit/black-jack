class Dealer < User
  attr_accessor :choice
  attr_reader :name

  def initialize
    @name = 'Dealer'
    super(@name)
  end

  def add_card?
    hand.score < 17
  end
end
