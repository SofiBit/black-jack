module TextInterface
  def line
    puts ''
  end

  def hello
    puts "Hello! Welcome to the Black Jack! What's youre name?"
  end

  def bet_text
    puts "#{user.name}, you make a bet - 10 $"
    line
  end

  def main_menu(open = nil)
    print "Cards of #{user.name}: "
    user.hand.cards_in_hand.each do |card|
      print "#{card.name_card}#{card.suit}  "
    end
    dealer_cards(open)
    print "Points of #{user.name}: #{user.hand.score}\t\t"
    dealer_points(open)
    line
  end

  def dealer_cards(open)
    return dealer_cards_open unless open.nil?

    card = '**'
    quantity_cards = dealer.hand.cards_in_hand.size
    cards_of_dealer
    quantity_cards.times { print "#{card} " }
    line
  end

  def dealer_cards_open
    cards_of_dealer
    dealer.hand.cards_in_hand.each do |card|
      print "#{card.name_card}#{card.suit}  "
    end
    line
  end

  def cards_of_dealer
    if user.name.length > 4 || user.hand.cards_in_hand.size > 2
      print "\tCards of Dealer: "
    else
      print "\t\tCards of Dealer: "
    end
  end

  def dealer_points(open)
    return puts 'Points of Dealer: ???' if open.nil?

    puts "Points of Dealer: #{dealer.hand.score}"
  end

  def text_user_move(number_move)
    whose_move(user)
    puts "#{user.name},choose!"
    puts '1 - add a card.'
    puts '2 - show cards.'
    puts '3 - skip the move.' if number_move == 1
  end

  def choice_dealer(what)
    system 'clear'
    whose_move(dealer)
    puts "Dealer сhose #{what}!"
    line
  end

  def mistake
    puts "#{user.name},enter a correct number"
  end

  def repeat_game
    puts 'Do you want to play more?'
    puts '1 - Уes'
    puts 'Any other character - No'
  end

  def text_end_game(result)
    puts "\t\t--------- OPEN CARDS --------"
    line
    main_menu(true)
    puts "Winner: #{result}!"
    puts "Currently on your bank account: #{user.bank.funds}$"
    line
  end

  def no_money_user
    puts "#{user.name}, you haven't money. Go to the home :)"
  end

  def no_money_dealer
    puts "Dealer haven't money!"
  end

  def whose_move(player)
    puts "\t\t---------- MOVE OF #{player.name.upcase} ----------"
  end
end
