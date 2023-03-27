class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question, dependent: :destroy

  validates :title, presence: true

end
