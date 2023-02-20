class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :test_users
  has_many :users, through: :test_users, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :level, numericality: { onle_integer: true, greater_than_or_equal_to: 0,
                                                        less_than_or_equal_to: 3 }, presence: true

  scope :easy_level, -> { where(level: 1) }
  scope :midle_level, -> { where(level: 2) }
  scope :hard_level, -> { where(level: 3) }
  scope :asc_ttitle_and_category, -> { order(title: :asc) }
  scope :desc_ttitle_and_category, -> (category_title) { 
                                       joins(:category)
                                         .where(categories: { title: category_title })
                                         .order(title: :desc) }

end
