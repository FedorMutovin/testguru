class User < ApplicationRecord
  def show_all_tests(level)
    TestsUser.where(test_id: Test.find_by(level: level).id, user_id: id)
  end
end
