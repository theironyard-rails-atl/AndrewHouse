require 'minitest/autorun'
require './homework4.rb'

describe Survey do

  before do
    @statements = ['How are you?', 'Do you like Fish?', 'Do you like Ruby?',
                  'Pick a number 1-5', 'Do you get a lot of sleep?']
    @survey = Survey.new(@statements)
    def user_response; 5 end
    @survey.ask_questions # comment out user_response on homework4.rb to run test
    @answers = [5,4,3,2,1]
  end

  it "takes statements as an argument" do
    assert_equal @statements, @survey.statement
  end

  it "answers should be empty before asking questions" do
    assert_equal @survey.answers.length, 0
  end

  it "calculates the highest number response" do
    assert_equal @survey.highest, 5
  end

  it "calculates the lowest number response" do
    assert_equal @survey.lowest, 1
  end

  it "calculates the average of answers" do
    assert_equal @survey.average, 3
  end

end
