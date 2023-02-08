class User < ApplicationRecord

  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users, dependent: :destroy

  def levels(lvl)
    Test.joins(:test_users)
          .where(test_users: {user_id: self.id},
                 tests: {level: lvl})
  end
end
