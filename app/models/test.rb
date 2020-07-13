class Test < ApplicationRecord
  def self.sort_descending(category_title)
    joins('JOIN categories ON categories.id == tests.category_id').where(categories: { title: category_title }).order('tests.title DESC').pluck('tests.title')
  end
end
