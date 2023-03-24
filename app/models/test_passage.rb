class TestPassage < ApplicationRecord

  RESPONSE_SUCCESS_RATE = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def color_result
    if test_result >= RESPONSE_SUCCESS_RATE
      "win" 
    else
      "lose"
    end
  end

  def current_question_number
    count_questions - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def test_result
    point_question
  end

  private

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?  
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct 
  end

  def point_question
    (self.correct_questions * 100) / count_questions
  end

  def count_questions
    self.test.questions.count
  end

end
