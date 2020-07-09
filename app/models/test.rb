class Test < ApplicationRecord
  belongs_to :category
  def self.sort_descending(category_title)
    Test.joins(:category).where(categories: { title: category_title }).order('tests.title DESC').pluck('tests.title')
  end
end
