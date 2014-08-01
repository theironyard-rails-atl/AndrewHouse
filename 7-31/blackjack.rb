class Card

  attr_reader :rank, :suit

  def initialize rank, suit
    @rank = rank
    @suit = suit
  end

  def value
    case @rank
    when :K, :Q, :J
      10
    when :A
      1
    else
      @rank
    end
  end
end

class Deck
  attr_accessor :deck, :drawn
  def initialize
    @deck = []
    @drawn = []
    load_deck
  end

  def cards
    load_deck if @deck == []
    remove_drawn_cards
    @deck
  end

  def draw
    a = @deck.sample
    @drawn << a
    remove_drawn_cards
    a
  end

  def remove_drawn_cards
    @drawn.each do |card|
      @deck.delete(card)
    end
  end

  def load_deck
    @deck = []
    face_cards = [:A, :K, :Q, :J]
    suits = [:C, :D, :H, :S]
    suits.each do |suit|
      2.upto(10) do |number_card|
        @deck << Card.new(number_card, suit)
      end
      face_cards.each do |face|
        @deck << Card.new(face, suit)
      end
    end
  end
end

class Hand
  attr_reader :hand
  def initialize
    @hand = []
  end

  def add *cards
    @hand << cards
  end

  def value
    val = 0
    ace = false
    @hand.each do |object|
      object.each do |card|
        ace = true if card.rank == :A
        if card.rank == :A && (val + card.value) < 21
          val += 10
        end
        val += card.value
        if val > 21 && ace
          val -= 10
        end
      end
    end
    val
  end

  def busted?
    self.value > 21
  end

  def blackjack?
    self.value == 21
  end

  def to_s
    string_array = []
    @hand.each do |object|
      object.each do |card|
        string_array << "#{card.rank}#{card.suit}"
      end
    end
    string_array.join(", ")
  end
end

class Player

  attr_accessor :total_cash

  def initialize
    @total_cash = 100
  end

end

class Game
  attr_accessor :player, :play_deck

  def initialize player
    @player = player
    @play_deck = Deck.new
  end

  def start_round
    @play_deck.draw
    @play_deck.draw
  end

  def hit
  end


end

a = Player.new
b = Game.new(a)
