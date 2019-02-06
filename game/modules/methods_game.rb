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

  def bet
    user.bank.give_money(common_bank, 10)
    dealer.bank.give_money(common_bank, 10)
    bet_text
  end

  def deal_cards
    2.times { deck.give_card(user.hand) }
    2.times { deck.give_card(dealer.hand) }
    main_menu
  end

  def move_user(number_move)
    text_user_move(number_move)

    options = [1, 2, 3]
    options.delete(3) if number_move == 2

    loop do
      choice = gets.chomp.to_i
      if options.include? choice
        system 'clear'
        return choice
      end

      mistake
    end
  end

  def add_card_user
    deck.give_card(user.hand)
  end

  def move_dealer
    if dealer.add_card?
      deck.give_card(dealer.hand)
      choice_dealer('to take the card')
    else
      choice_dealer('not to take the card')
    end
    main_menu
  end

  def end_game
    result = who_winner
    result_array = [user, dealer]
    if result_array.include? result
      common_bank.give_money(result.bank, common_bank.funds)
      return text_end_game(result.name)
    end

    text_end_game(result)
  end

  def who_winner
    return dealer if dealer_winner?
    return user if user_winner?
    return 'no winner. All lost' if user.hand.score > 21 && dealer.hand.score > 21
    return 'no winner. Draw' if user.hand.score == dealer.hand.score
  end

  def dealer_winner?
    return true if user.hand.score > 21 && dealer.hand.score <= 21
    return true if dealer.hand.score > user.hand.score

    false
  end

  def user_winner?
    return true if user.hand.score > dealer.hand.score
    return true if dealer.hand.score > 21 && user.hand.score <= 21

    false
  end

  def money
    unless user.bank.money?
      no_money_user
      return 1
    end
    unless dealer.bank.money?
      no_money_dealer
      return 1
    end
  end
end
