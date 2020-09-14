class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  scope :backend, -> { where(title: ['Ruby', 'Ruby on Rails']) }

  has_many :tests, dependent: :nullify

  validates :title, presence: true
end
