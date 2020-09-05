class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :feedback_forms, dependent: :destroy

  def test_passage(test)
    test_passages.order(id: :desc).find_by test_id: test.id
  end

  def admin?
    is_a?(Admin)
  end
end
