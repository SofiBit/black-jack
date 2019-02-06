class Dealer < User

  attr_accessor :choice
  attr_reader :name

  def initialize
    @name = 'Dealer'
    super(@name)
  end

  def add_card?
    return true if self.hand.score < 17

    false
  end
end
