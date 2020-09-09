class Badge < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, :file, presence: true
end
