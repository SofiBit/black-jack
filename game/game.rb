# logic of game
class Game
  attr_reader :user, :dealer, :common_bank
  attr_accessor :deck

  include MethodsGame
  include TextInterface

  def initialize
    go
    @dealer = Dealer.new
    @common_bank = Bank.new('BlackJack')
  end

  def game
    loop do
      begin_game
      repeat_game
      choice = gets.chomp.to_i
      break unless choice == 1
      break if money(dealer, user) == 1
    end
  end

  private

  def begin_game
    system 'clear'

    user.hand.discard_cards
    dealer.hand.discard_cards
    self.deck = Deck.new

    bet(dealer, user, common_bank)
    deal_cards(dealer, user, deck)
    choice = move_user(user, 1)
    choice_user(choice)
  end

  def choice_user(choice)
    case choice
    when 1 then when_1
    when 2 then end_game(common_bank, dealer, user)
    when 3 then when_3
    end
  end

  def when_1
    add_card_user(user, deck)
    move_dealer(dealer, deck)
    end_game(common_bank, dealer, user)
  end

  def when_3
    move_dealer(dealer, deck)
    add_card_user(user, deck) if move_user(user, 2) == 1
    end_game(common_bank, dealer, user)
  end
end
