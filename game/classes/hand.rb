class Hand
  attr_reader :owner, :cards_in_hand

  def initialize(owner)
    @owner = owner
    @cards_in_hand = []
  end

  def take_card(card)
    cards_in_hand << card
  end

  def discard_cards
    cards_in_hand.clear
  end
end
