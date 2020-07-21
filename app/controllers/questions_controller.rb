class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[edit destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new; end

  def edit; end

  def show
    render plain: @question.body
  end

  def index
    render plain: @test.questions
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос удален'
  end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
