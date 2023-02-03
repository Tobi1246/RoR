class User < ApplicationRecord
  def levels(lvl)
   Test.joins("JOIN test_users ON test_users.test_id = tests.id")
         .where(tests: {level: lvl})
  end
end
