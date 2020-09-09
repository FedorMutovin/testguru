class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: %i[create update]

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def success_rate
    (correct_questions / test.questions.count.to_f) * 100
  end

  def ruby_tests_completed?
    tests = user.tests.ruby.successful
    return false if tests.count < 2

    titles = tests.titles
    return true if titles.include?('Мастер Руби') && titles.include?('Основы Руби')
  end

  def give_badges
    give_first_time_badge
    give_ruby_or_rails_badges
    give_test_guru_master_badge
  end

  def successful?
    success_rate >= 85
  end

  def current_question_index
    test.questions.order(:id).index(current_question) + 1
  end

  def progress
    (current_question_index.to_f / test.questions.count * 100).round
  end

  private

  def rails_tests_completed?
    tests = user.tests.ruby.successful
    return false if tests.count < 2

    titles = tests.titles
    return true if titles.include?('Rails-модели') && titles.include?('Rails-контроллеры')
  end

  def give_test_guru_master_badge
    user.badges << Badge.find_by(name: 'Test Guru Master') if ruby_tests_completed? && rails_tests_completed?
  end

  def give_ruby_or_rails_badges
    user.badges << Badge.find_by(name: 'Ruby Master') if ruby_tests_completed?
    user.badges << Badge.find_by(name: 'Rails Master') if rails_tests_completed?
  end

  def give_first_time_badge
    if user.tests.where(title: test.title).count == 1 && test.successful
      user.badges << Badge.find_by(name: 'First Time')
    end
  end

  def before_validation_set_first_question
    self.current_question = next_question
  end

  def correct_answer?(answers_ids)
    correct_answers.ids.sort == answers_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_create_set_count
    self.count += 1
  end

  def next_question
    if new_record?
      self.current_question = test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
