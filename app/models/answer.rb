class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_size, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_size
    errors.add(:question, 'Max 4 answers') if question.answers.count >= 4
  end
end
