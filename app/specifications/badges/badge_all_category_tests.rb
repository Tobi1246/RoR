module Badges  
  class BadgeAllCategoryTests < AbstractBadgeSpec

    def satisfied?
      @category_id = @conditions_params.to_i
      Test.all.where(category_id: @category_id) == @current_user.completed_test_where_category(@category_id).uniq unless cduplicate?
    end

    def cduplicate?
       @current_user.badges.exists?(conditions_params: @conditions_params)
    end

  end
end
