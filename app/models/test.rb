class Test < ApplicationRecord
  def self.sort_descending(category_title)
    joins('JOIN categories ON categories.id == tests.category_id').order(title: :desc).where(id: Category.find_by(title: category_title).id).pluck(:title)
  end
end
