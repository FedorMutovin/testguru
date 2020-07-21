class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new; end

  def edit; end

  def show
    render plain: Question.find(params[:id]).body
  end

  def index
    render plain: @test.questions
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  private

  def find_test
    @test = Question.find(params[:test_id]).test
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
