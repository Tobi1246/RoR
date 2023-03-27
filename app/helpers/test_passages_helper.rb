module TestPassagesHelper

  def result_on_test(test_passage)
    if test_passage.completed_test?
      "<p class='win'> You typed #{test_passage.point_question} score
      <br>UR COMPLED TEST</p>".html_safe 
    else
      "<p class='lose'> You typed #{test_passage.point_question } score
      <br>UR FALED TEST</p>".html_safe
    end
  end

end
