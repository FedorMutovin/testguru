class BadgeIssuance
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def give_badges
    Badge.select { |badge| send badge.rule_type, badge }
  end

  def first_try(badge)
    @user.tests.where(title: @test_passage.test.title).count.eql?(badge.rule_value.to_i) && @test_passage.successful
  end

  def category(badge)
    return false unless @test_passage.test.category.title.eql?(badge.rule_value)

    Test.where(category: Category.find_by(title: badge.rule_value)).each do |test|
      tests = @user.tests.where(title: test.title)
      return false unless tests.present? && tests.where('test_passages.successful').first.present?
    end
    true
  end

  def level(badge)
    return false unless @test_passage.test.level.eql?(badge.rule_value.to_i)

    Test.where(level: badge.rule_value.to_i).each do |test|
      tests = @user.tests.where(title: test.title)
      return false unless tests.present? && tests.where('test_passages.successful').first.present?
    end
    true
  end
end
