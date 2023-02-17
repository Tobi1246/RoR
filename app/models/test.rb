class Test < ApplicationRecord

  belongs_to :author, class_name: "User"
  belongs_to :category
 
  has_many :test_users
  has_many :users, through: :test_users, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, uniqueness: true, presence: true
  validates :level, numericality: {onle_integer: true}, presence: true 
  validate :validate_min_level, :validate_max_level

  scope :easy_level, -> {where(level: 1)}
  scope :midle_level, -> {where(level: 2)}
  scope :hard_level, -> {where(level: 3)}

  scope :desc_ttitle_and_category, -> {desc_ttitle_and_category.order(title: :desc)}

  def self.desc_ttitle_and_category(category_title )
    includes(:category)
      .where(categories: {title: category_title})
  end

  private

  def validate_min_level
    errors.add(:level) if level.to_i < 1
  end

  def validate_max_level
    errors.add(:level) if level.to_i > 3
  end
end
