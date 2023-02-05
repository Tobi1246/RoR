class User < ApplicationRecord
  def levels(lvl)
   Test.joins("JOIN test_users ON test_users.test_id = tests.id")
         .where(test_users: {user_id: self.id},
                tests: {level: lvl})
  end
end
