# frozen_string_literal: true

require_relative 'game'

class Player
  PLAYER_ID = 0
  START_CASH = 30
  attr_accessor :id, :hand, :cash, :name, :game_status

  def initialize(name)
    @name = name
    @game_status = :in_game
    @id = PLAYER_ID + 1
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

  def calculate
    hand_value = 0
    @hand.cards.each do |card|
			if card.card_nominal.instance_of?(Integer)
        hand_value += card.card_nominal
      else
        case card.card_nominal
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
    end
    hand_value
  end
end
