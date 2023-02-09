class User < ApplicationRecord

  has_many :tests
  has_many :test_users
  has_many :tests, through: :test_users, dependent: :destroy

  def levels(lvl)
    Test.(:test_users)
          .where(test_users: {user_id: self.id},
                 tests: {level: lvl})
  end
end
