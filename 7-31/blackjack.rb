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

  def one_card
    card = @hand[0][0]
    "#{card.rank}#{card.suit}"
  end
end

class Player

  attr_accessor :total_cash

  def initialize
    @total_cash = 100
  end

end

class Game
  attr_accessor :player, :play_deck, :dealt_cards, :dealer

  def initialize
    @player = Player.new
    @dealer = Hand.new
    @play_deck = Deck.new
    @dealt_cards = Hand.new
  end

  def start_round
    2.times do
      @dealt_cards.add(@play_deck.draw)
      @dealer.add(@play_deck.draw)
    end
  end

  def show_hand
    @dealt_cards.to_s
  end

  def dealer_show
    @dealer.to_s
  end

  def dealer_show_one_card
    @dealer.one_card
  end

  def hit
    @dealt_cards.add(@play_deck.draw)
  end

  def dealer_hit
    if @dealer.value < 17
      @dealer.add(@play_deck.draw)
    end
  end

  def player_score
    @dealt_cards.value
  end

  def dealer_score
    @dealer.value
  end

  def busted?
    @dealt_cards.busted?
  end

  def won?
    return true if @dealt_cards.blackjack? && @dealer.blackjack? == false
    return true if @dealer.busted?
    (@dealt_cards.value > @dealer.value) && busted? == false
  end

  def dealer_done?
    @dealer.value >= 17
  end

  def round_over?
    won? || busted? || @dealer.busted?
  end

  def reset_hand
    @dealer = Hand.new
    @dealt_cards = Hand.new
  end

end
