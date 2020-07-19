class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_questions

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new; end

  def edit; end

  def show; end

  def delete; end

  def destroy
    @questions.destroy

    render plain: @questions.inspect
  end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find_by(params[:id])
  end

  def find_questions
    @questions = @test.questions
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
