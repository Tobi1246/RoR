module TestPassagesHelper

  def result_on_test(test_passage)
    if I18n.locale == :en
      locale_en(test_passage)
    else
      locale_ru(test_passage)
    end
  end

  def locale_ru(test_passage)
    if test_passage.completed_test?
      "<p class='alert alert-success row justify-content-center mt-3'> Вы набрали #{test_passage.point_question} очков
      <br>ВЫ ПРОШЛИ ТЕСТ</p>".html_safe 
    else
      "<p class='alert alert-danger row justify-content-center mt-3'> You typed #{test_passage.point_question } score
      <br>ВЫ ПРОВАЛИЛИ ТЕСТ</p>".html_safe
    end
  end

  def locale_en(test_passage)
    if test_passage.completed_test?
      "<p class='alert alert-success row justify-content-center mt-3'> You typed #{test_passage.point_question} score
      <br>UR COMPLED TEST</p>".html_safe 
    else
      "<p class='alert alert-danger row justify-content-center mt-3'> You typed #{test_passage.point_question } score
      <br>UR FALED TEST</p>".html_safe
    end
  end

end
