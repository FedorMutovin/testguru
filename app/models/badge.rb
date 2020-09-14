class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :file, presence: true

  def self.first_try
    find_by name: 'first_try'
  end

  def self.backend
    find_by name: 'backend'
  end

  def self.level
    find_by name: 'level'
  end
end
