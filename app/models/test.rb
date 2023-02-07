class Test < ApplicationRecord

  has_many :test_users
  has_many :users, through: :test_users
  has_many :questions
  has_one :category

  def self.desc_ttitle_and_category(category_title )
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: {title: category_title})
      .order(title: :desc)
  end
end
