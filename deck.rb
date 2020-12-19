# frozen_string_literal: true

require_relative 'game'

class Deck
  attr_accessor :all_cards

  def initialize
    @all_cards = []
    suits = Card.const_get('SUITS')
    values = Card.const_get('VALUES')
    (0..(values.size - 1)).each do |i|
      (0..(suits.size - 1)).each do |j|
        @all_cards << Card.new(values[i], suits[j])
      end
    end
  end
  
end
