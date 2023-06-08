module Badges
  class BadgeAllLevelTests < AbstractBadgeSpec

    def satisfied?
      @level = @conditions_params.to_i
      Test.all.where(level: @level) == @current_user.completed_test_where_level(@level).uniq unless ldublicate?
    end

    def ldublicate?
       @current_user.badges.exists?(name: "Comleted all tests level:#{ @level }")
    end

  end
end
