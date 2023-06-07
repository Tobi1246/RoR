class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy

  validates :name, presence: true
  validates :img, presence: true

  IMG_FOR_PASSAGE_TEST = [ "nill",
                           "https://mir-s3-cdn-cf.behance.net/user/276/8853769.549b42d8ad386.jpg",
                           "http://ru.meneger.net/images/photo/1548618680.jpg",
                           "https://image.emojipng.com/226/5139226.jpg" ].freeze

  def self.img(test_passage)
     IMG_FOR_PASSAGE_TEST[test_passage.test.level] || 0
  end

end
