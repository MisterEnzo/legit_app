class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :responses

  def rating
    ratings = self.reviews.map { |review| review.rating }
    total = 0
    ratings.each { |rating| total += rating }
    count = ratings.count
    total / count
  end
end
