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
  attr_reader :deck
  def initialize
    @deck = {}
  end

  def cards
    suits = [:C, :D, :H, :S]
    face_cards = [:K, :Q, :J, :A]
    suits.each do |suit|
      2.upto(10) do |x|
        card = Card.new(x, suit)
        @deck[card.rank] = card.suit
      end
      face_cards.each do |i|
        face = Card.new(i, suit)
        @deck[face.rank] = face.suit
      end
    end
    @deck
  end
end

a = Deck.new
p a.cards
