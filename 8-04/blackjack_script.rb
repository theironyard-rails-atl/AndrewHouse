require './blackjack.rb'

class PlayGame

  def initialize
    @play = Game.new
    @bets = Player.new
  end

  def start_game
    @play.start_round
  end

  def puts_hands
    puts "You " + @play.show_hand
    puts "Dealer " + @play.dealer_show_one_card
    puts "\n"
  end

  def puts_final_hands
    puts "Here are the final hands! \n"
    puts "You " + @play.show_hand + " -- #{@play.player_score}"
    puts "Dealer " + @play.dealer_show + " -- #{@play.dealer_score}"
    puts "\n"
    if @play.player_score == @play.dealer_score
      puts "It's a tie!"
    elsif @play.won?
      @bets.total_cash += 10
      puts "You won the hand! You have a total of #{@bets.total_cash} Dollars!"
    else
      @bets.total_cash -= 10
      puts "You lost the hand...ouch. You're down to #{@bets.total_cash} Dollars."
    end
  end

  def hit?
    puts_hands
    puts "Would you like to hit? Y or N"
    puts "\n"
    response = gets.chomp
    if response.upcase == "Y"
      @play.hit
      true
    else
      return false
    end
  end

  def game_logic
    start_game
    until @play.round_over?
      a = hit?
      break if @play.busted?
      break if a == false
    end
    until @play.dealer_done?
      @play.dealer_hit
    end
    puts_final_hands
    @play.reset_hand
    game_logic unless quit?
  end

  def quit?
    puts "Would you like to quit playing? Y or N"
    response = gets.chomp
    true if response.upcase == "Y"
  end
end

PlayGame.new.game_logic
