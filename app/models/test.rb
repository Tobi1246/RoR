class Test < ApplicationRecord
  def self.desc_ttitle_and_category(category_title )
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: {title: category_title})
      .order(title: :desc)
  end
end
