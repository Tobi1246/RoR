class Badge < ApplicationRecord
  belongs_to :user

  def self.img(test_passage)
    achivment_lvl = test_passage.test.level
    if achivment_lvl == 1
      "https://mir-s3-cdn-cf.behance.net/user/276/8853769.549b42d8ad386.jpg"
    elsif achivment_lvl == 2
      "http://ru.meneger.net/images/photo/1548618680.jpg"
    elsif achivment_lvl == 3
      "https://image.emojipng.com/226/5139226.jpg"
    end  
  end



end
