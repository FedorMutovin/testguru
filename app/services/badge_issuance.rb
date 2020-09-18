class BadgeIssuance
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def give_badges
    Badge.select { |badge| send badge.rule_type, badge }
  end

  def first_try(badge)
    @user.tests.where(title: @test_passage.test.title).count.eql?(1) && @test_passage.successful
  end

  def category(badge)
    return unless @test_passage.test.category.eql?(badge.rule_value)

    Test.where(category: Category.find_by(title: badge.rule_value)).each do |test|
      tests = @user.tests.where(title: test.title)
      return false unless tests.present? && tests.test_passages.successful_completed.present?
    end
  end

  def level
    Badge.level
  end
end
