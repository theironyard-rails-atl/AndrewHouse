require './questions.rb'

class Quiz
attr_reader :quiz
  def initialize *quiz
    @quiz = quiz
    @question_number = 1
  end

  def begin_quiz
    correct_answers = 0
    incorrect_answers = 0
    puts "Please answer with a number 1-4."
    @quiz.each do |i|
      puts i.question
      sleep 0.5
      puts i.choices
      puts "\n"
      user_choice = gets.chomp
      if user_choice.to_i != 0
        user_choice = user_choice.to_i
      else
        case user_choice.upcase
        when "A"
          user_choice = 1
        when "B"
          user_choice = 2
        when "C"
          user_choice = 3
        when "D"
          user_choice = 4
        end

      puts "\n"
      end
      if user_choice == i.answer
        sleep 0.5
        puts "Correct!"
        correct_answers += 1
      else
        sleep 0.5
        puts "Incorrect!"
        incorrect_answers += 1
      end
      @question_number += 1
      puts "\n"
    end
    puts "You got #{correct_answers} answers correct, and
    #{incorrect_answers} incorrect"
  end
end

a = Question.new( question: "Who is the creator of Ruby?",
                   choices: [
                    "1.) Yukihiro Matsumoto",
                    "2.) David Heinemeier Hansson",
                    "3.) Guido van Rossum",
                    "4.) Larry Wall"
                    ],
                   answer: 1 )

b = Question.new( question: "What is the version control manager we are using?",
                  choices: [
                    "1.) Ruby",
                    "2.) Rails",
                    "3.) Git",
                    "4.) Heroku"
                  ],
                  answer: 3 )

new_quiz = Quiz.new(a, b)
new_quiz.begin_quiz
