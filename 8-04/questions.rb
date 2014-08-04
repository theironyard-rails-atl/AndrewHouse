class Question
  attr_reader :question, :answer, :choices

  def initialize options={}
    @question = options[:question]
    @answer = options[:answer]
    @choices = options[:choices]
  end


end
