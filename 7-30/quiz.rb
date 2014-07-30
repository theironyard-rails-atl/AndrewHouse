Questions = [
  {
    question: "Who is the creator of Ruby?",
    choices: [
      "1.) Yukihiro Matsumoto",
      "2.) David Heinemeier Hansson",
      "3.) Guido van Rossum",
      "4.) Larry Wall"
    ],
    answer: 1
  },
  {
    question: "What is the version control manager we are using?",
    choices: [
      "1.) Ruby",
      "2.) Rails",
      "3.) Git",
      "4.) Heroku"
    ],
    answer: 3
  },
  {
    question: "What does the acronymn REPL stand for?",
    choices: [
      "1.) Read Engineer Plus Lose",
      "2.) Rails Engineer Per List",
      "3.) Read Evaluate Puts Loop",
      "4.) Read Evaluate Print Loop"
    ],
    answer: 4
  },
  {
    question: "In Ruby, how do you declare a global variable?",
    choices: [
      "1.) $",
      "2.) @",
      "3.) @@",
      "4.) #"
    ],
    answer: 1
  },
  {
    question: "Where can you find documentation on ruby methods?",
    choices: [
      '1.) ruby-doc.org',
      '2.) ruby.com',
      '3.) ruby-info.org',
      '4.) ruby-methods.com'
    ],
    answer: 1
  }
]

class Quiz

  def initialize quiz, num_questions
    @quiz = quiz
    @num_questions = num_questions
    @question_number = 1
  end

  def begin_quiz
    correct_answers = 0
    incorrect_answers = 0
    random_order = @quiz.sample(@num_questions)
    puts "Please answer with a number 1-4."
    random_order.each do |i|
      puts i[:question]
      sleep 0.5
      puts i[:choices]
      puts "\n"
      user_choice = gets.chomp.to_i
      puts "\n"
      if user_choice == i[:answer]
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

new_quiz = Quiz.new(Questions, 5)
new_quiz.begin_quiz
