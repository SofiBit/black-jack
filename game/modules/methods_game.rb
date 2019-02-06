module MethodsGame
  def go
    hello
    begin
      name = gets.chomp.to_s
      @user = User.new(name)
    rescue StandardError
      puts 'Enter correct name!'
      retry
    end
  end

  def bet(dealer, user, common_bank)
    user.bank.give_money(common_bank, 10)
    dealer.bank.give_money(common_bank, 10)
    bet_text(user)
  end

  def deal_cards(dealer, user, deck)
    2.times { user.hand.take_card(deck.give_card) }
    2.times { dealer.hand.take_card(deck.give_card) }
    main_menu(dealer, user)
  end

  def move_user(user, number_move)
    text_user_move(user, number_move)

    options = [1, 2, 3]
    options.delete(3) if number_move == 2

    loop do
      choice = gets.chomp.to_i
      if options.include? choice
        system 'clear'
        return choice
      end

      mistake(user)
    end
  end

  def add_card_user(user, deck)
    user.hand.take_card(deck.give_card)
  end

  def move_dealer(dealer, deck)
    if dealer.add_card?
      dealer.hand.take_card(deck.give_card)
      choice_dealer('to take the card')
    else
      choice_dealer('not to take the card')
    end
    main_menu(dealer, user)
  end

  def end_game(common_bank, dealer, user)
    result = who_winner(dealer, user)
    result_array = [user, dealer]
    if result_array.include? result
      common_bank.give_money(result.bank, common_bank.funds)
      return text_end_game(dealer, user, result.name)
    end

    text_end_game(dealer, user, result)
  end

  def who_winner(dealer, user)
    return 'no winner. All lost' if user.hand.score > 21 && dealer.hand.score > 21
    return 'no winner. Draw' if user.hand.score == dealer.hand.score

    return user if user.hand.score > dealer.hand.score && user.hand.score <= 21
    return dealer if dealer.hand.score > user.hand.score && dealer.hand.score <= 21
    return dealer if user.hand.score > 21
    return user if dealer.hand.score > 21
  end

  def money(dealer, user)
    unless user.bank.money?
      no_money_user(user)
      return 1
    end
    unless dealer.bank.money?
      no_money_dealer
      return 1
    end
  end
end
