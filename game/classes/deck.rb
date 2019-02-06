class Deck
  attr_reader :cards

  NAME_CARD = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUIT = %w[♠ ♥ ♣ ♦].freeze

  def initialize
    @cards = []
    creature_deck
  end

  def give_card
    cards.pop
  end

  private

  def creature_deck
    NAME_CARD.each do |name_card|
      SUIT.each do |suit|
        cards << Card.new(name_card, suit)
      end
    end
    cards.shuffle!
  end
end
