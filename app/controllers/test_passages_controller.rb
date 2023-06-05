class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      # TestsMailer.completed_test(@test_passage).deliver_later
      badge_conditions if tests_compleed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def badge_conditions
    current_user.badges.create!(name: @test_passage.test.title, img: Badge.img(@test_passage))
    current_user.first_passage_tests(@test_passage)
    if all_levels_completed_badge && ldublicate?
      current_user.badges.create!(name: "Comleted all tests level:#{@test_passage.test.level}",
                                  img: 'https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg')
    end
    if all_category_completed_badge && cduplicate?
      current_user.badges.create!(name: "Comleted all tests category:#{@test_passage.test.category.title}",
                                  img: 'https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg')
    end
  end

  def ldublicate?
    if current_user.badges.find_by(name: "Comleted all tests level:#{@test_passage.test.level}")
      false
    else
      true
    end
  end

  def cduplicate?
    if current_user.badges.find_by(name: "Comleted all tests category:#{@test_passage.test.category.title}")
      false
    else
      true
    end
  end

  def all_levels_completed_badge
    Test.all.where(level: @test_passage.test.level) == current_user.completed_test_where_level(@test_passage.test.level).uniq
  end

  def all_category_completed_badge
    Test.all.where(category_id: @test_passage.test.category_id) == current_user.completed_test_where_category(@test_passage.test.category_id).uniq
  end

  def tests_compleed?
    @test_passage.completed_test?
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
