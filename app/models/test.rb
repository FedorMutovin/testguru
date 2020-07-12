class Test < ApplicationRecord
  def self.sort_descending(category_title)
    category_id = Category.find_by(title: category_title).id
    order(title: :desc).where(category_id: category_id).pluck(:title)
  end
end
