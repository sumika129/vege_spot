class Post < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  belongs_to :area
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def get_image
    if image.attached?
      image
    else
      'noimage2.png'
    end
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def self.search(keyword)
    where(["item like? OR impression like? OR shop like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end


  def self.area_search(keyword)
    includes(:area).where(areas: {id: keyword})
  end

  def self.category_search(keyword)
    includes(:category).where(categories: {id: keyword})
  end

end
