class User < ApplicationRecord
  def show_all_tests(level)
    Test.where(level: level, user_id: id)
  end
end
