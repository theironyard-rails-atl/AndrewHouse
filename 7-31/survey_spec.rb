require 'minitest/autorun'
require './homework4.rb'

describe Survey do

  before do
    @statements = ['How are you?', 'Do you like Fish?', 'Do you like Ruby?',
                  'Pick a number 1-5', 'Do you get a lot of sleep?']
    @survey = Survey.new(@statements)
  end

  it "takes statements as an argument" do
    assert_equal @statements, @survey.statement
  end

  it "answers should be empty before asking questions" do
    assert_equal @survey.answers.length, 0
  end

  it "calculates the highest number response" do
    
  end

  it "calculates the lowest number response"

  it "calculates the average of answers"

end
