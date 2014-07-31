class Survey
  attr_reader :statement, :answers
  def initialize statement
    @statement = statement
    @answers = []
  end

  def user_response
    gets.chomp.to_i
  end
  
  def ask_questions
    @statement.each do |question|
      puts question
      user_answer = user_response
      if user_answer >5 || user_answer < 1 || user_answer.is_a?(Fixnum) == false
        next puts "Invalid Answer - Skipping Question"
      end
      @answers << user_answer
    end
    highest
    lowest
    average
  end

  def highest
    @answers.sort[-1]
  end

  def lowest
    @answers.sort[0]
  end

  def average
    (@answers.inject(&:+)/@answers.length.to_f).round(2)
  end
end
