module TestsHelper

  TEST_LEVELS = { 1 => :easy, 2 => :medium, 3 => :hard }.freeze
  TEST_LEVELS_RU = { 1=> 'легкий', 2 => 'средний', 3 => 'сложный' }.freeze

  def test_level(test)
    if I18n.locale == :en
      TEST_LEVELS[test.level] || :hero 
    else
      TEST_LEVELS_RU[test.level] || :hero
    end
  end

  def current_year
    Time.current.year
  end 

end
