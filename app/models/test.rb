class Test < ApplicationRecord
	def self.sort_list(category)
		self.joins("INNER JOIN categories ON category_id = categories.id")
		.where(" categories.title = ? , #{category}")
		.order('test.title DESC')
	end
end
