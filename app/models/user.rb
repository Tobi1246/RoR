class User < ApplicationRecord
  def levels(lvl)
   Test.select("tests.level, tests.title, users.firstname")
         .joins("JOIN test_users ON test_users.user_id = users.id
                 JOIN users ON test_users.test_id = tests.id")
         .where(users: {id: self.id},
                tests: {level: lvl})
  end
end
