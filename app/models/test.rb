class Test < ApplicationRecord

  belongs_to :author, class_name: "User"
  belongs_to :category
 
  has_many :test_users
  has_many :users, through: :test_users, dependent: :destroy
  has_many :questions, dependent: :destroy
 
  def self.desc_ttitle_and_category(category_title )
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: {title: category_title})
      .order(title: :desc)
  end
end
