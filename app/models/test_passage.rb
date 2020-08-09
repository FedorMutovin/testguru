class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_create :before_create_set_first_question, on: create
  before_update :before_update_select_next_question

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  private

  def before_create_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_select_next_question
    self.current_question = next_question
  end

  def correct_answer?(answers_ids)
    correct_answers.ids.sort == answers_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
