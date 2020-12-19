# frozen_string_literal: true

require_relative 'game'

class Dealer < Player
  def initialize
    super('Dealer')
    @id = 0
  end

  def decision(deck)
    if calculate < 17
      take_card(deck)
    else
      skip
    end
  end
end
