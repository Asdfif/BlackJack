# frozen_string_literal: true

require_relative 'game'

class Deck
  attr_accessor :all_cards

  def initialize
    @all_cards = []
    Card::VALUES.each do |i|
      Card::SUITS.each do |j|
        @all_cards << Card.new(Card::VALUES[i], Card::SUITS[j])
      end
    end
  end
end
