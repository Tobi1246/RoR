	class User < ApplicationRecord
  def levels(lvl)
	 self.joins("INNER JOIN test_users ON test_users.user_id = users.id
	 						 INNER JOIN tests ON tests.id = test_users.test_id
							 WHERE test_id = user_id")
	   .where(tests: {level: lvl})
	end
end
