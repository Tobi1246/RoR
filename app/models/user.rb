class User < ApplicationRecord
  def levels(lvl)
	 self.joins(tests: [:test_users])
	   .where(tests: {level: lvl})
	end
end
