module TestPassagesHelper
  def current_question_index
    @test_passage.test.questions.index(@test_passage.current_question) + 1
  end
end
