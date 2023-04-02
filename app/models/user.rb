require 'digest/sha1'

class User < ApplicationRecord

  has_many :created_tests, class_name: "Test",
                           foreign_key: "author_id",
                           dependent: :destroy              
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  has_secure_password

  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                    message: 'Incorrect Email' }
  validates :firstname, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def levels(level)
    tests.where(level: level)
  end

end
