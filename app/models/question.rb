class Question < ApplicationRecord
  
  belongs_to :test

  has_many :answers, dependent: :destroy 

  validates :title, presence: true
  validate :validate_answers_size



  def validate_answers_size
    errors.add(:answers, "Question have maximum 4 answers") if Question.joins(:answers).count('question_id') > 4
  #  errors.add(:answers, "Question have min 4 answers") if answerscount < 1
  end

end
