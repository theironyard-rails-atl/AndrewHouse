require 'pry'

def grade num
  case num
  when 90..100
    "A"
  when 80..89
    "B"
  when 70..79
    "C"
  when 60..69
    "D"
  else
    "F"
  end
end

def students num
  (50..100).to_a.sample(num)
end

def grade_count letter, number_of_students
  grades_array = students number_of_students
  grades_array.select{ |i| grade(i) if grade(i) == letter.upcase}.count
end


def number_guessing_game
  puts "Pick a number between 1 and 1000"
  random_number = (1..1000).to_a.sample
  10.downto(0) do |num_guesses|
    guess = gets.chomp.to_i
    binding.pry
    next puts "You must choose a number BETWEEN 1 and 1000."if guess < 1 || guess > 1000
    if guess > random_number
      puts "#{guess} is too high. You have #{num_guesses} remaining!"
    elsif guess < random_number
      puts "#{guess} is too low. You have #{num_guesses} remaining!"
    else
      return puts "#{guess} is the correct number!"
    end
  end
  puts "I'm sorry you lost. The number was #{random_number}"
end


# As far as having the computer guess, the easiest way would be to either
# to implement a linear search (will take up the guesses really fast) or
# a more complicated binary search. The Range class has a bsearch function
# built in and that would be the way to go.

class ShoppingCart

  def initialize cart={}
    @cart = cart
    @purchase_total = 0
  end

  def add_item item, cost_of_item
    @cart[item] = cost_of_item
  end

  def remove_item item
    @cart.delete item
  end

  def item_cost item
    @cart[item]
  end

  def total_cost
    purchases
    grand_total = @purchase_total
    grand_total -= (grand_total * 0.1) if grand_total > 100
    grand_total += (grand_total * 0.04)
    grand_total
  end

  private

  def purchases
    @purchase_total = 0
    @cart.each_value { |value| @purchase_total += value }
    @purchase_total
  end

end


# Hangman Game
#
#   Prompt user1 for a word
#   Print to screen the number of letters and spaces in _
#   Initiate a downto loop (number of guesses)
#     Prompt user2 for a letter
#     Return If there are no remaining _'s then user2 has won
#     If correct show _ spaces with letter in place
#     Else state it is an incorrect answer.
#       Show remaining guesses and iterate through the next cycle
#     End
#   End
#   If the loop has ended Break and state that user1 has won and show the actual
#   word.
