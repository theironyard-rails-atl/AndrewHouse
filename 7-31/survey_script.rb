require './homework4.rb'

statements = ['How are you?', 'Do you like Fish?', 'Do you like Ruby?',
              'Pick a number 1-5', 'Do you get a lot of sleep?']

class CompleteSurvey
  def initialize statements
    @questionairre = Survey.new(statements)
  end

  def complete_questionairre
    initial_prompt
    @questionairre.ask_questions
    puts "\n"
    puts @questionairre.highest
    puts @questionairre.lowest
    puts @questionairre.average
  end

  def initial_prompt
    puts "Answer the questions on a scale from 1-5"
  end
end

quiz = CompleteSurvey.new(statements).complete_questionairre
