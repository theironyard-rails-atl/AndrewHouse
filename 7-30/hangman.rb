require "minitest/autorun"

describe Hangman do

  before do
    @word = "word"
    @game = Hangman.new(@word)
    @remaining_guess = 5
  end

  it "should generate a word to be solved" do
    assert_equal game.word, true
  end

  it "should generate a board" do
    assert_equal @game.board.length, @game.word.length
    assert @game.board != @game.word
  end

  it "should take user guesses" do
    assert_equal @game.guess, true
  end

  it "should count number of remaining guesses" do
    assert_equal @game.remaining_guess, 5
  end

  it "should subtract a guess given an incorrect answer" do
    @game.remaining_guess = 5
    @game.guess("a")
    @assert_equal @game.remaining_guess, 4
  end

  it "should not subtract a guess given a correct answer" do
    @game.remaining_guess = 5
    @game.guess("w")
    assert_equal @game.remaining_guess, 5
  end

  it "should declare of the user has won" do
    assert_equal @game.won?, true
  end

  it "should show correct letters on the board" do
    @game.guess("w")
    assert_equal @game.board, "w___"
  end

end
