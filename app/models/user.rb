class User < ApplicationRecord
	def levels(lvl)
		self.joins("INNER JOIN tests ON author_id = users.id")
		  .where("level = ? ,#{lvl}")
	end
end
