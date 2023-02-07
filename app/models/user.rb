class User < ApplicationRecord

  has_many :test_users
  has_many :tests, through: :test_users
  
  def levels(lvl)
    Test.joins("JOIN test_users ON test_users.test_id = tests.id")
          .where(test_users: {user_id: self.id},
                 tests: {level: lvl})
  end
end
