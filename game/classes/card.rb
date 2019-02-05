class Card
  attr_reader :name_card, :suit

  def initialize(name_card, suit)
    @name_card = name_card
    @suit = suit
  end

  def points
    return 10 if %w[J Q K].include? name_card
    return 11 if name_card == 'A'
    return name_card.to_i if name_card.to_i
  end

  def ace?
    return true if name_card == 'A'

    false
  end
end
