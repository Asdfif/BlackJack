# frozen_string_literal: true

require_relative 'game'

class Card
  attr_accessor :card_suit, :card_nominal

  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = ["\u2665".encode('utf-8').to_s, "\u2666".encode('utf-8').to_s, "\u2663".encode('utf-8').to_s, "\u2660".encode('utf-8').to_s].freeze

  def initialize(nominal, suit)
    @card_nominal = nominal
    @card_suit = suit
  end
end
