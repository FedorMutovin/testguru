class BadgeIssuance
  GIVE_BADGES = %i[give_first_time_badge give_ruby_master_badge give_rails_master_badge give_test_guru_master_badge].freeze
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def give_badges
    GIVE_BADGES.map { |give_badge| send give_badge }.compact
  end

  def give_first_time_badge
    Badge.first_time if @user.tests.where(title: @test_passage.test.title).count.eql?(1) && @test_passage.successful
  end

  def give_ruby_master_badge
    Badge.ruby_master if ruby_completed?
  end

  def give_rails_master_badge
    Badge.rails_master if rails_completed?
  end

  def give_test_guru_master_badge
    Badge.test_guru_master if rails_completed? && ruby_completed?
  end

  def rails_completed?
    rails_models_tests = @user.tests.rails_models.map do |test|
      test.test_passages.where(successful: false)[0]
    end
    rails_controllers_tests = @user.tests.rails_controllers.map do |test|
      test.test_passages.where(successful: false)[0]
    end
    rails_models_tests.present? && rails_controllers_tests.present?
  end

  def ruby_completed?
    ruby_basics_tests = @user.tests.ruby_basics.map do |test|
      test.test_passages.where(successful: false)[0]
    end
    master_ruby_tests = @user.tests.master_ruby.map do |test|
      test.test_passages.where(successful: false)[0]
    end
    ruby_basics_tests.present? && master_ruby_tests.present?
  end
end
