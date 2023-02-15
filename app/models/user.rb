class User < ApplicationRecord

  has_many :created_tests, class_name: "Test",
                           foreign_key: "author_id",
                           dependent: :destroy              
  has_many :test_users
  has_many :tests, through: :test_users, dependent: :destroy

  def levels(lvl)
    Test.includes(:users)
          .where(test_users: {user_id: self.id},
                 tests: {level: lvl})
  end
end
