class Hand
  attr_reader :owner, :cards_in_hand
  attr_accessor :score

  def initialize(owner)
    @owner = owner
    @cards_in_hand = []
    @score = 0
  end

  def take_card(card)
    cards_in_hand << card

    if card.ace? && score > 10
      self.score += 1
    else
      self.score += card.points
    end
  end

  def discard_cards
    cards_in_hand.clear
    self.score = 0
  end
end
