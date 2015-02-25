include ActionView::Helpers::NumberHelper

class BlackJackPlayer
  attr_accessor :betting_unit
  attr_accessor :name
  attr_accessor :current_hand
  attr_accessor :current_bet
  attr_accessor :dealer_hand

  def initialize(name = "Cody", betting_unit = 5)
    @betting_unit = betting_unit
    @name = name
    @current_bet = betting_unit
    @current_hand = "No hand"
    @dealer_hand = "No hand"
  end

  def print
    puts
    puts
    puts "Player statistics:"
    puts "- Name:          #{@name}"
    puts "- Betting unit:  #{@betting_unit}"
    puts "- Current Hand:  #{@current_hand}"
    puts "- Current Bet:   #{@current_bet}"
    puts "- Dealer Hand:   #{@dealer_hand}"
    puts
  end

  def bet
    @current_bet ||= @betting_unit
    puts "#{@name} is betting #{number_to_currency(@current_bet)}"
  end

  def deal
    bet
    puts
    @current_hand = [*4..21].sample
    @dealer_hand = [*2..10].sample
    puts "#{@name} was dealt #{@current_hand}"
    if @current_hand == 21
      puts " - BLACKJACK! #{@name} has won #{number_to_currency(@current_bet * 1.5)}!"
    end
    puts
    puts "Dealer is showing a #{@dealer_hand}"
  end

  def hit
    puts "#{@name} is hitting on a #{@current_hand}"
    dealt_card = [*2..10].sample
    puts "  ... was dealt a #{dealt_card}"
    @current_hand += dealt_card
    if @current_hand > 21
      puts "  and BUSTED with a hand of #{@current_hand}, losing #{number_to_currency(@current_bet)}!"
    else
      puts "  and now has a hand of #{@current_hand}"
    end
  end

  def stand
    puts "#{@name} is staying with a #{@current_hand}"
    puts
    puts "Dealer is showing a #{@dealer_hand}"
    while @dealer_hand < 17
      sleep 1
      card = [*2..10].sample
      @dealer_hand += card
      puts "  dealer was dealt a #{card} => Total: #{@dealer_hand}"
    end
    sleep 1
    if @dealer_hand > 21
      puts "  and BUSTED with a hand of #{@dealer_hand}"
      puts
      puts "#{@name} has won #{number_to_currency(@current_bet)}!"
    else
      puts "  and stays on a #{@dealer_hand}"
      puts
      if @dealer_hand > @current_hand
        puts "#{@name} has LOST #{number_to_currency(@current_bet)}!"
      else
        if @dealer_hand == @current_hand
          puts "#{@name} has PUSHED"
        else
          puts "#{@name} has won #{number_to_currency(@current_bet)}!"
        end
      end
    end
  end

  def double_down
    puts "#{@name } doubling down on #{@current_hand}"
    @current_bet = @current_bet*2
    hit
    stand
  end

  def split
    puts "I'm splitting 8, 8"
  end
end

class Gorilla < BlackJackPlayer
  def initialize(name = "Jack")
    super(name, 100)
  end
end

module Translation
  def self.table
    {
      tree:     1,
      switch:   2,
      stool:    3,
      car:      4,
      glove:    5,
      gun:      6,
      craps:    7,
      pool:     8,
      cat:      9,
      bowling:  10,
      football: 11,
      eggs:     12,
      witch:    13,
      ring:     14,
      paycheck: 15,
      sweet:    16,
      magazine: 17
    }
  end
end

class Spotter < BlackJackPlayer
  include Translation
  attr_accessor :current_count

  def initialize(name = "Kevin")
    super(name)
    @current_count = 1
  end

  def record_the_count(count = 1)
    @current_count = count
  end

  def announce_the_count
    keyword = Translation.table.select { |key, value| value == @current_count }.keys.first.to_s
    return "How do you say '#{keyword}' in Spanish?  Anyone?"
  end

  def dismiss
    return "#{@name} says: 'Jack Black in the movie King Kong was terrible'"
  end

  def print
    super
    puts "- Current Count: #{@current_count}"
    puts
  end
end

class BigPlayer < BlackJackPlayer
  include Translation
  attr_accessor :current_count

  def initialize(name = "Cody")
    super(name, 150)
    @current_count = 1
  end

  def bet(count = nil)
    @current_count = count if count
    @current_bet = @current_count * @betting_unit
    puts "#{@name} is betting #{number_to_currency(@current_bet)}, according to the count"
  end

  def translate_to_count(statement)
    statement.downcase!
    words = statement.split(" ")
    words.each { |w| w.gsub!(/[^a-z]/i, '') }
    keywords = Translation.table.keys.map { |k| k.to_s }
    keyword = (keywords & words).first
    if keyword
      @current_count = Translation.table[keyword.to_sym]
    else
      @current_count = 1
    end
    return "#{@name} thinks: 'Nice, so the count is #{@current_count}'"
  end

  def print
    super
    puts "- Current Count: #{@current_count}"
    puts
  end
end
