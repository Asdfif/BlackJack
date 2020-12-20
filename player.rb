# frozen_string_literal: true

require_relative 'game'

class Player
  START_CASH = 30
  attr_accessor :hand, :cash, :name, :game_status

  def initialize(name)
    @name = name
    @game_status = :in_game
    @cash = START_CASH
  end

  def bet(value)
    @cash -= value
  end

  def take_hand(deck)
    @hand = Hand.new(deck)
  end

  def skip; end

  def take_card(deck)
    @hand.add_card(deck)
  end
end
