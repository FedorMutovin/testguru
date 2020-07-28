module QuestionsHelper
  def question_header(test, question)
    return "Новый вопрос для теста: #{test.title}" if question.new_record?

    "Редактирование вопроса теста: #{question.test.title}"
  end
end
