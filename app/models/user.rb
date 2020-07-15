class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :tests, foreign_key: :author_id

  def show_all_tests(level)
    tests.where(level: level)
  end
end
