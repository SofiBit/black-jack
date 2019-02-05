module PointsCounter
  def game_points(hand)
    amount_points = 0
    ace = false

    hand.cards_in_hand.each do |card|
      amount_points += card.points
      ace = true if card.ace?
    end

    amount_points -= 10 if amount_points > 21 && ace

    amount_points
  end

  def points_user
    game_points(user.hand)
  end

  def points_dealer
    game_points(dealer.hand)
  end
end
