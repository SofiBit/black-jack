class Deck
  attr_reader :cards

  NAME_CARD = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUIT = %w[♠ ♥ ♣ ♦].freeze

  def initialize
    @cards = {}
    creature_deck
  end

  def give_card(hand)
    card = random_card

    hand.take_card(card)

    cards.each { |key, value| cards.delete(key) if value == card }
  end

  private

  def creature_deck
    i = 1
    NAME_CARD.each do |name_card|
      SUIT.each do |suit|
        cards[i] = Card.new(name_card, suit)
        i += 1
      end
    end
  end

  def random_card
    cards_keys = cards.keys

    random_key = cards_keys.sample

    cards[random_key]
  end
end
