class User < ApplicationRecord
	def levels(lvl)
		self.joins("INNER JOIN tests ON tests.id = users.id")
		  .where("level = ? ,#{lvl}")
	end
end
