class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :review_images
  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true

  mount_uploader :image, ImageUploader

end
