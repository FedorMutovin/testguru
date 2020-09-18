class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :file, :reason, :rule_type, :rule_value, presence: true
end
