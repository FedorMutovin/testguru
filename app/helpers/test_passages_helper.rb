module TestPassagesHelper
  def correct_answers
    correct_answers = []
    @test_passage.test.questions.each do |question|
      correct_answers.push question.answers.correct.count
    end
    correct_answers.sum
  end

  def success_rate
    (@test_passage.correct_questions / correct_answers.to_f) * 100
  end

  def successful?
    success_rate >= 85
  end
end
