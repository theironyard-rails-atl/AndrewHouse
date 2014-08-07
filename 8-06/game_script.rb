require './game.rb'

class MakeBoxer

  attr_reader :name, :type, :boxer

  def initialize
    @type, @name, @boxer = ''
  end

  def choose_boxer
    puts "What kind of Boxer would you like?"
    puts "Please choose A, B, or C"

    puts "A.) Fast"
    puts 'B.) Powerful'
    puts "C.) Durable"
    puts 'D.) All Around'
    puts ""
    @type = gets.chomp.downcase

    puts "What would you like to name your boxer?"
    @name = gets.chomp
  end

  def boxer_type
    choose_boxer
    case @type
    when 'a'
      @boxer = SpeedBoxer.new name: @name
    when 'b'
      @boxer = PowerBoxer.new name: @name
    when 'c'
      @boxer = DurableBoxer.new name: @name
    when 'd'
      @boxer = Boxer.new name: @name
    when 'megatron'
      @boxer = Megatron.new name: @name
    else
      raise
    end
    rescue
      retry
  end
end

$red = MakeBoxer.new.boxer_type
$blue = MakeBoxer.new.boxer_type

class Match
  attr_reader :red, :blue
  def initialize
    @red = $red
    @blue = $blue
  end

  def intro
    puts "#{@red.name} is in the Red Corner. He has a power of #{@red.power},
    a speed of #{red.speed} and durability of #{@red.durability}."
    sleep 2.0
    puts "#{@blue.name} is in the Blue Corner. He has a power of #{@blue.power},
    a speed of #{blue.speed} and durability of #{@blue.durability}."
    sleep 2.0
    puts "FIGHT!"
    sleep 2.0
  end

  def fight
    intro
    until @red.knockout? || @blue.knockout?

      @red.punch @blue unless special_move @red, @blue
      puts "#{@blue.name}'s durability is now #{@blue.durability}"
      break if @blue.knockout?
      @blue.punch @red unless special_move @blue, @red
      puts "#{red.name}'s durability is now #{@red.durability}"
      break if @red.knockout?
      puts "Next Round!"
      puts ""
      sleep 2.0
    end
    if @red.knockout?
      puts "#{blue.name} is the winner!"
    else
      puts "#{red.name} is the winner!"
    end
  end

  def special_move boxer, defender
    return if boxer.class == Boxer
    puts ""
    puts "#{boxer.name}'s special move will cost 3 durability.
    You currently have #{boxer.durability} durability.
     Would you like to use it? (y/n)"
    answer = gets.chomp.downcase
    puts ""

    if answer == 'y'
      case boxer
      when PowerBoxer
        puts "#{boxer.name} uses Uppercut!"
        boxer.uppercut defender
      when SpeedBoxer
        puts "#{boxer.name} uses Flurry!"
        boxer.flurry defender
      when DurableBoxer
        puts "#{boxer.name} uses Turtle!"
        boxer.turtle defender
      when Megatron
        puts "#{boxer.name} uses ULTIMATE COMBO"
        boxer.ultimate_combo defender
      else
        puts 'its not working'
      end
    else
      false
    end
  end
end

Match.new.fight
