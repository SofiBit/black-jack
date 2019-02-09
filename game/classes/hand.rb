class Hand
  attr_reader :owner, :cards_in_hand, :score

  def initialize(owner)
    @owner = owner
    @cards_in_hand = []
    @score = 0
  end

  def take_card(card)
    cards_in_hand << card

    return @score += 1 if card.ace? && score > 10

    @score += card.points
  end

  def discard_cards
    cards_in_hand.clear
    @score = 0
  end

  def see_cards
    cards_in_hand.map { |card| card.name_card + card.suit }.join('  ')
  end
end
