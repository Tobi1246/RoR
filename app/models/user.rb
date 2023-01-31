class User < ApplicationRecord
  def levels(lvl)
	 self.joins("INNER JOIN test_users ON tests_id = users_id")
	   .where(tests: {level: lvl})
	end
end
