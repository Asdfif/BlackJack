# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'hand'

class Game
  BET = 10

  attr_accessor :players, :bank, :queue, :deck, :table, :score, :winners, :interface

  def initialize(name, interface)
    @interface = interface
    @players = []
    @queue = []
    @players = []
    @players << Player.new(name)
    @players << Dealer.new
    start
  end

  def start
    @winners = []
    @score = 0
    @bank = 0
    @deck = Deck.new
    reset_players_game_status
    make_a_bet
    show_table(:game)
    turn
    end_round
    new_round
  end

  def new_round
    if @interface.new_round_menu == '1'
      start
    else
      abort
    end
  end

  def end_round
    loosers
    show_table(:end)
    results
    if ran_out_of_money
      player = ran_out_of_money
      @interface.looser(player)
      abort
    end
  end

  def ran_out_of_money
    looser = nil
    @players.each do |player|
      looser = player if player.cash <= 0
    end
    looser
  end

  def show_table(process)
    if process == :game
      @players.each { |player| @interface.player_hand(player) }
    else
      @players.each { |player| @interface.player_info(player) }
    end
  end

  def reset_players_game_status
    @players.each { |player| player.game_status = :in_game }
  end

  def loosers
    @players.each do |player|
      player.game_status = :lose if player.hand.calculate > 21
    end
  end

  def results
    @players.each do |player|
      if player.game_status != :lose
        if @score < player.hand.calculate
          @winners = [player]
        elsif @score == player.hand.calculate
          @winners << player
        end
        @score = player.hand.calculate
      end
      player.hand = nil
    end
    @interface.show_results(@winners)
    case @winners.size
    when 0
      @bank = 0
    when 1
      @winners.first.cash += @bank
    else
      @winners.each { |players| players.cash += BET }
    end
  end

  def make_a_bet
    @players.each do |player|
      player.take_hand(@deck)
      player.bet(BET)
      @bank += BET
    end
  end

  def turn
    @players.each do |player|
      if player.name != 'Dealer'
        case @interface.turn_menu
        when '1'
          player.skip
        when '2'
          player.take_card(@deck)
        when '3'
          break
          end_round
        end
      else
        player.decision(@deck)
      end
    end
  end
end
