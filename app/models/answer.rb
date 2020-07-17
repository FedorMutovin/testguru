class Answer < ApplicationRecord
  belongs_to :question
  scope :correct_answers, -> { where(correct: true) }
  validates :body, presence: true

  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:answers_max_count, 'Не может быть более 4ех ответов') if question.answers.count >= 4
  end
end
