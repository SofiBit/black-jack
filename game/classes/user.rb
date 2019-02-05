require_relative 'hand'
require_relative 'bank'

class User
  attr_reader :name, :bank, :hand

  def initialize(name)
    @name = name.capitalize
    validate!
    @bank = Bank.new(self, 100)
    @hand = Hand.new(self)
  end

  private

  def validate!
    raise 'No valid name' if name !~ /[a-z]+/
  end
end
