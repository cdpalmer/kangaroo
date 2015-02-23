include ActionView::Helpers::NumberHelper

class BlackJackPlayer
  attr_accessor :betting_unit
  attr_accessor :name
  attr_accessor :current_hand
  attr_accessor :current_bet
  attr_accessor :dealer_hand

  def initialize(name = "Cody", betting_unit = 5)
    # ...
  end

  def bet
    # ...
  end

  def deal
    bet
    # ...
  end

  def hit
    dealt_card = [*2..10].sample
    @current_hand += dealt_card
    # ...
  end

  def stand
    play_out_dealer_hand
    determine_winner
  end

  def double_down
    @current_bet = @current_bet*2
    hit
    stand
  end

  def split
    # ...
  end
end

class Gorilla < BlackJackPlayer
  def initialize(name = "Jack")
    # Initialize name and betting unit
    super(name, 100)
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
  end

  def translate_to_count(statement)
    keyword = translate_statement(statement)
    @current_count = Translation.table[keyword.to_sym]
  end
end
