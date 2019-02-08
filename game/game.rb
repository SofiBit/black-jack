# logic of game
class Game
  attr_reader :user, :dealer, :common_bank, :interface
  attr_accessor :deck

  include MethodsGame

  def initialize
    @dealer = Dealer.new
    @common_bank = Bank.new('BlackJack')
    @interface = TextInterface.new
    go
  end

  def game
    loop do
      begin_game
      interface.repeat_game
      choice = gets.chomp.to_i
      break unless choice == 1
      break if money == 1
    end
  end

  private

  def begin_game
    system 'clear'

    user.hand.discard_cards
    dealer.hand.discard_cards
    self.deck = Deck.new

    bet
    deal_cards
    choice = move_user(1)
    choice_user(choice)
  end

  def choice_user(choice)
    case choice
    when 1 then when_1
    when 2 then end_game
    when 3 then when_3
    end
  end

  def when_1
    add_card_user
    move_dealer
    end_game
  end

  def when_3
    move_dealer
    add_card_user if move_user(2) == 1
    end_game
  end
end
