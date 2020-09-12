class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :file, presence: true

  def self.first_time
    find_by name: 'On The First Try'
  end

  def self.ruby_master
    find_by name: 'Ruby Master'
  end

  def self.rails_master
    find_by name: 'Rails Master'
  end

  def self.test_guru_master
    find_by name: 'Test Guru Master'
  end
end
