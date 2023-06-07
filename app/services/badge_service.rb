class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = test_passage.user
  end

  def test_passed_the_first_try?
    if @current_user.test_passages.where(test_id: @test_passage.test_id).count == 1
      @current_user.badges.create!(name: "passege in first try #{@test_passage.test.title}",
                    img: 'https://cdn1.vectorstock.com/i/1000x1000/37/15/completed-rubber-stamp-vector-12423715.jpg')
    end
  end

  def call
    badge_conditions
  end

  def badge_conditions
    @current_user.badges.create!(name: @test_passage.test.title, img: Badge.img(@test_passage))
    test_passed_the_first_try?
    if all_levels_completed_badge && !ldublicate?
      @current_user.badges.create!(name: "Comleted all tests level:#{@test_passage.test.level}",
                                  img: 'https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg')
    end
    if all_category_completed_badge && !cduplicate?
      @current_user.badges.create!(name: "Comleted all tests category:#{@test_passage.test.category.title}",
                                  img: 'https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg')
    end
  end

  private

  def all_levels_completed_badge
    Test.all.where(level: @test_passage.test.level) == @current_user.completed_test_where_level(@test_passage.test.level).uniq
  end

  def all_category_completed_badge
    Test.all.where(category_id: @test_passage.test.category_id) == @current_user.completed_test_where_category(@test_passage.test.category_id).uniq
  end

  def ldublicate?
     @current_user.badges.exists?(name: "Comleted all tests level:#{ @test_passage.test.level }")
  end

  def cduplicate?
     @current_user.badges.exists?(name: "Comleted all tests category:#{ @test_passage.test.category.title }")
  end

end