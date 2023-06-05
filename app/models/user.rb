class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :created_tests, class_name: 'Test',
                           foreign_key: 'author_id',
                           dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :completed_tests, -> { where(test_passages: { completed: true }) }, through: :test_passages, source: :test
  has_many :feedbacks, dependent: :destroy
  has_many :badges, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: 'Incorrect Email' }
  validates :firstname, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end


  def completed_test_where_level(level)
    completed_tests.where(level: level)
  end

  def completed_test_where_category(category)
    completed_tests.where(category: category)
  end  

  def first_passage_tests(test_passage)
    if test_passages.where(test_id: test_passage.test_id).count == 1
      badges.create(name: "passege in first try #{test_passage.test.title}",
                    img: 'https://cdn1.vectorstock.com/i/1000x1000/37/15/completed-rubber-stamp-vector-12423715.jpg')
    end
  end
end
