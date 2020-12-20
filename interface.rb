# frozen_string_literal: true

require_relative 'game'

class Interface
  attr_accessor :game

  def initialize
    puts 'Добро пожаловать в BlackJack!'
    menu
  end

  def menu
    puts '1 - Начать игру'
    puts '2 - Выход'
    choice = gets.chomp
    case choice
    when '1'
      @game = Game.new(player_name, self)
    when '2'
      abort
    end
  end

  def player_hand(player)
    puts
    if player.name != 'Dealer'
      puts "#{player.name} #{player.cash}$ cards "
      show_cards(player)
    else
      puts "#{player.name} #{player.cash}$ cards "
      player.hand.cards.each { |_card| puts ' *' }
    end
  end

  def show_cards(player)
    player.hand.cards.each do |card|
      puts "#{card.card_nominal}#{card.card_suit} "
    end
  end

  def player_info(player)
    puts
    puts "#{player.name} #{player.cash}$ cards "
    show_cards(player)
    puts "Score: #{player.hand.calculate}"
  end

  def show_results(winners)
    puts
    case winners.size
    when 0
      puts 'Casino wins'
    when 1
      puts "Winner: #{winners.first.name}"
    else
      puts 'DROW!'
    end
  end

  def turn_menu
    puts '1 - Skip'
    puts '2 - Take card'
    puts '3 - Show cards'
    gets.chomp
  end

  def player_name
    puts 'Введите имя игрока'
    gets.chomp
  end

  def new_round_menu
    puts
    puts '1 - Сыграть еще'
    puts 'Другая кнопка - Выйти из игры'
    gets.chomp
  end

  def looser(player)
    puts
    puts "Игрок #{player.name} остался без денег"
  end
end

i = Interface.new
