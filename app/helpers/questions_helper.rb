module QuestionsHelper
  def question_header(method)
    if method.eql?(:edit)
      "Редактирование вопроса теста: #{@question.test.title}"
    else
      "Новый вопрос для теста: #{@test.title}"
    end

  end
end
