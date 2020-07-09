class User < ApplicationRecord
  def show_all_tests(level)
    Test.where(level: level)
  end
end
