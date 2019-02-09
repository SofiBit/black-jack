module MethodsGame
  def main_menu(open = nil)
    interface.user_menu(user.name, user.hand.see_cards, user.hand.score)
    interface.dealer_menu(dealer.hand.see_cards, dealer.hand.score, dealer.hand.cards_in_hand.size, open)
  end

  def text_end(result)
    interface.open_cards
    main_menu(true)
    interface.text_end_game(user.bank.funds, result)
  end

  def go
    interface.hello
    begin
      name = gets.chomp.to_s
      @user = User.new(name)
    rescue StandardError
      puts 'Enter correct name!'
      retry
    end
  end

  def bet
    user.bank.give_money(common_bank, 10)
    dealer.bank.give_money(common_bank, 10)
    interface.bet_text(user.name)
  end

  def deal_cards
    2.times { user.hand.take_card(deck.give_card) }
    2.times { dealer.hand.take_card(deck.give_card) }
    main_menu
  end

  def move_user(number_move)
    interface.text_user_move(user.name, number_move)

    options = [1, 2, 3]
    options.delete(3) if number_move == 2

    loop do
      choice = gets.chomp.to_i
      if options.include? choice
        system 'clear'
        return choice
      end

      interface.mistake(user.name)
    end
  end

  def add_card_user
    user.hand.take_card(deck.give_card)
  end

  def move_dealer
    if dealer.add_card?
      dealer.hand.take_card(deck.give_card)
      interface.choice_dealer('to take the card')
    else
      interface.choice_dealer('not to take the card')
    end
    interface.dealer_menu(dealer.hand.see_cards, dealer.hand.score, dealer.hand.cards_in_hand.size)
  end

  def end_game
    result = who_winner
    result_array = [user, dealer]
    if result_array.include? result
      common_bank.give_money(result.bank, common_bank.funds)
      return text_end(result.name)
    end

    text_end(result)
  end

  def who_winner
    return 'no winner. All lost' if user.hand.score > 21 && dealer.hand.score > 21
    return 'no winner. Draw' if user.hand.score == dealer.hand.score

    return user if user.hand.score > dealer.hand.score && user.hand.score <= 21
    return dealer if dealer.hand.score > user.hand.score && dealer.hand.score <= 21
    return dealer if user.hand.score > 21
    return user if dealer.hand.score > 21
  end

  def money
    unless user.bank.money?
      interface.no_money_user(user.name)
      return 1
    end
    unless dealer.bank.money?
      interface.no_money_dealer
      return 1
    end
  end
end
