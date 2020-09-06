class FeedbackFormsController < ApplicationController
  def new
    @feedback = FeedbackForm.new
  end

  def create
    @feedback = FeedbackForm.new(feedback_params)
    if @feedback.valid?
      FeedbackFormsMailer.send_to_admin(@feedback).deliver_now
      redirect_to tests_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback_form).permit(:text, :email)
  end
end
