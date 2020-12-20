# frozen_string_literal: true

require_relative 'game'

class Deck
  attr_accessor :all_cards

  def initialize
    @all_cards = []
    (0..(Card::VALUES.size - 1)).each do |i|
      (0..(Card::SUITS.size - 1)).each do |j|
        @all_cards << Card.new(Card::VALUES[i], Card::SUITS[j])
      end
    end
  end
end
