# frozen_string_literal: true

require_relative 'game'

class Hand
  attr_accessor :cards

  def initialize(deck)
    @cards = []
    2.times do 
      add_card(deck)
    end
  end

  def add_card(deck)
    card = deck.all_cards.sample
    @cards << card
    deck.all_cards.delete(card)
  end

  def calculate
    hand_value = 0
    @cards.each do |card|
      case card.card_nominal
      when Integer
        hand_value += card.card_nominal
      when 'A'
        if hand_value + 11 > 21
          hand_value += 1
        else
          hand_value += 11
        end
      else
        hand_value += 10
      end
    end
    hand_value
  end
end
