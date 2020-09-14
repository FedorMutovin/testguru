class BadgeIssuance
  GIVE_BADGES = %i[give_first_try_badge give_backend_badge ].freeze
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def give_badges
    GIVE_BADGES.map { |give_badge| send give_badge }.compact
  end

  def give_first_try_badge
    Badge.first_try if @user.tests.where(title: @test_passage.test.title).count.eql?(1) && @test_passage.successful
  end

  def give_backend_badge
    Badge.backend if backend_tests_completed?
  end

  def give_level_badge
    Badge.level if level_tests_completed?
  end

  def backend_tests_completed?
    tests = @user.tests
    Category.backend.each do |category|
      return false unless tests.where(category: category).include?(tests.where(category: category)
                               .where('test_passages.successful_completed'))
    end
    true
  end

  def level_tests_completed?
    tests = @user.tests
    tests.backend.each do |test|
      return false unless test.where(level: test.level).include?(tests.where(level: test.level)
                                                                      .where('test_passages.successful_completed'))
    end
    true
  end
end
