class BadgeIssuance
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  RULES = %w[category level first_try].freeze

  def give_badges
    Badge.select { |badge| send badge.rule_type, badge }
  end

  def first_try(badge)
    @user.tests.where(title: @test_passage.test.title).count.eql?(badge.rule_value.to_i) && @test_passage.successful
  end

  def category(badge)
    return false if @user.badges.include?(badge)
    return false unless @test_passage.test.category.title.eql?(badge.rule_value)

    category_tests_ids = Test.where(category: Category.find_by(title: badge.rule_value)).select(:id)
    user_tests_ids = @user.tests.where(category: Category.find_by(title: badge.rule_value))
                          .where('test_passages.successful').select(:id)

    (category_tests_ids - user_tests_ids).empty?
  end

  def level(badge)
    return false if @user.badges.include?(badge)
    return false unless @test_passage.test.level.eql?(badge.rule_value.to_i)

    level_tests_ids = Test.where(level: badge.rule_value.to_i).select(:id)
    user_tests_ids = @user.tests.where(level: badge.rule_value.to_i).where('test_passages.successful').select(:id)

    (level_tests_ids - user_tests_ids).empty?
  end
end
