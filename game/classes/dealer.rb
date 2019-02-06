class Dealer < User

  attr_accessor :choice
  attr_reader :name

  def initialize
    @name = 'Dealer'
    super(@name)
  end

  def add_card?
    self.hand.score < 17
  end
end
