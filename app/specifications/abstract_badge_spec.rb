class AbstractBadgeSpec
  def initialize(test_passage, conditions_params)
    @test_passage = test_passage
    @current_user = test_passage.user
    @conditions_params = conditions_params
  end

  def satisfied?
    raise "#{__method__} unfifined for #{self.class} "
  end

end
