class AbstractBadgeSpec

  def initialize(test_passage, cunductions_params)
    @test_passage = test_passage
    @current_user = test_passage.user
    @cunductions_params = cunductions_params
  end

  def satisfied?
    raise "#{__method__} unfifined for #{self.class} "
  end

end
