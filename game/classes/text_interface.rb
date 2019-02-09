class TextInterface
  def line
    puts ''
  end

  def hello
    puts "Hello! Welcome to the Black Jack! What's youre name?"
  end

  def bet_text(user_name)
    puts "#{user_name}, you make a bet - 10 $"
    line
  end

  def user_menu(user_name, user_cards, user_score)
    puts "Cards of #{user_name}: #{user_cards}"
    puts "Points of #{user_name}: #{user_score}"
    line
  end

  def dealer_menu(dealer_cards, dealer_score, quantity_cards, open = nil)
    dealer_cards(quantity_cards, dealer_cards, open)
    line
    dealer_points(dealer_score, open)
    line
  end

  def dealer_cards(quantity_cards, dealer_cards, open)
    return dealer_cards_open(dealer_cards) unless open.nil?

    print 'Cards of Dealer: '

    card = '**'
    quantity_cards.times { print "#{card} " }
  end

  def dealer_cards_open(dealer_cards)
    print "Cards of Dealer: #{dealer_cards}"
  end

  def dealer_points(dealer_score, open)
    return puts 'Points of Dealer: ???' if open.nil?

    puts "Points of Dealer: #{dealer_score}"
  end

  def text_user_move(user_name, number_move)
    whose_move(user_name)
    puts "#{user_name},choose!"
    puts '1 - add a card.'
    puts '2 - show cards.'
    puts '3 - skip the move.' if number_move == 1
  end

  def choice_dealer(what)
    system 'clear'
    whose_move('Dealer')
    puts "Dealer сhose #{what}!"
    line
  end

  def mistake(user_name)
    puts "#{user_name},enter a correct number"
  end

  def repeat_game
    puts 'Do you want to play more?'
    puts '1 - Уes'
    puts 'Any other character - No'
  end

  def open_cards
    puts "\t\t--------- OPEN CARDS --------"
    line
  end

  def text_end_game(funds, result)
    puts "Winner: #{result}!"
    puts "Currently on your bank account: #{funds}$"
    line
  end

  def no_money_user(user_name)
    puts "#{user_name}, you haven't money. Go to the home :)"
  end

  def no_money_dealer
    puts "Dealer haven't money!"
  end

  def whose_move(player)
    puts "\t\t---------- MOVE OF #{player.upcase} ----------"
  end
end
