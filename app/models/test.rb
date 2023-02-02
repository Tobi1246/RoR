class Test < ApplicationRecord
  def self.desc_ttitle_and_category(category)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: {title: category})
      .order('test.title DESC')
  end
end
