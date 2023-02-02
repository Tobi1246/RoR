class User < ApplicationRecord
  def levels(lvl)
   TestUser.joins("INNER JOIN users ON test_users.user_id = users.id
                   INNER JOIN tests ON test_users.test_id = tests.id")
            .where(users: {id: self.id},
                  tests: {level: lvl})
  end
end
