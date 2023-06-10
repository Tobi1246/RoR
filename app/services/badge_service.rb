class BadgeService
  CONDUCTION = {
    pasage_in_first_try: Badges::BadgePassegeInFirstTryTest,
    completed_all_level_tests: Badges::BadgeAllLevelTests,
    completed_all_category_tests: Badges::BadgeAllCategoryTests
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      condition = CONDUCTION[badge.conditions.to_sym].new(@test_passage, badge.conditions_params)
      add_badges(badge) if condition.satisfied?
    end
  end

  private

  def add_badges(badge)
    @current_user.badges << badge
  end
end
