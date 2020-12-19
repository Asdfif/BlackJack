# frozen_string_literal: true

require_relative 'game'

class Hand
  attr_accessor :cards

  def initialize(deck)
    @cards = []
    add_card(deck)
    add_card(deck)
  end

  def add_card(deck)
    card = deck.all_cards.sample
    @cards << card
    deck.all_cards.delete(card)
  end
end
