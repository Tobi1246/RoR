class User < ApplicationRecord

  has_many :created_tests, class_name: "Test",
                           foreign_key: "author_id",
                           dependent: :destroy              
  has_many :test_users
  has_many :tests, through: :test_users, dependent: :destroy

  validates :firstname, presence: true

  def levels(lvl)
    tests.where(level: lvl)
  end
end
