class Bank
  attr_accessor :funds
  attr_reader :owner

  def initialize(owner, funds = 0)
    @owner = owner
    @funds = funds
  end

  def give_money(bank, quantity)
    return if funds < quantity

    self.funds -= quantity.to_i

    bank.take_money(quantity)
  end

  def take_money(quantity)
    self.funds += quantity.to_i
  end

  def money?
    funds > 0
  end
end
