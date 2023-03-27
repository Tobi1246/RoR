class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy

  validates :level, numericality: { onle_integer: true, greater_than_or_equal_to: 0,
                                                        less_than_or_equal_to: 3 }, presence: true

  scope :easy_level, -> { where(level: 1) }
  scope :midle_level, -> { where(level: 2) }
  scope :hard_level, -> { where(level: 3) }
  scope :desc_title_and_category, -> (category_title) { joins(:category)
                                         .where(categories: { title: category_title })
                                         .order(title: :desc) }

  def self.desc_title_by_category(category_title)
    desc_title_and_category(category_title).pluck(:title)
  end
end
